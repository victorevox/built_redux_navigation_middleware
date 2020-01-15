import 'package:built_redux/built_redux.dart';
import 'package:built_redux/built_redux_test_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../example/lib/example.dart';

import 'package:built_redux_navigation_middleware/built_redux_navigation_middleware.dart';

// class MockNavigationMiddleware extends Mock implements NavigationMiddleware<ExampleState, ExampleStateBuilder, ExampleActions>{}
class MockNavigationService extends Mock implements NavigationService {}

class MockNavigatorKey extends Mock implements GlobalKey<NavigatorState> {}

class MockNavigatorState extends Mock implements NavigatorState {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return "";
  }
}

class MyNavigationGuard
    implements NavigationGuard<ExampleState, ExampleStateBuilder> {
  @override
  Future<GuardedPushedRoute> call(
      String name, Object arguments, ExampleState state) async {
    switch (name) {
      case "shouldBeOverriden":
        name = "wasOverriden";
        arguments = {"prop": "overrided", "stateProp": state.exampleProp};
        break;
      default:
    }
    return GuardedPushedRoute(name: name, arguments: arguments);
  }
}

void main() {
  Store<ExampleState, ExampleStateBuilder, ExampleActions> store;
  NavigationService mockNavigationService;
  NavigationGuard navigationGuardExample = MyNavigationGuard();

  final String _stateProp = "test";

  setUp(() {
    mockNavigationService = MockNavigationService();
    store = Store<ExampleState, ExampleStateBuilder, ExampleActions>(
        ReducerBuilder<ExampleState, ExampleStateBuilder>().build(),
        ExampleState().rebuild((b) => b..exampleProp = _stateProp),
        ExampleActions(),
        middleware: [
          NavigationMiddleware<ExampleState, ExampleStateBuilder,
                  ExampleActions>(
              navigationService: mockNavigationService,
              navigationGuards: [
                navigationGuardExample,
              ])()
        ]);
  });

  group("middleware", () {
    test("pop", () {
      store.actions.navigation.pop();
      verify(mockNavigationService.pop());
    });

    test("popUntil", () {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPopUntilPayload payload =
          NavigationPopUntilPayload(predicate: predicate);
      store.actions.navigation.popUntil(payload);
      verify(mockNavigationService.popUntil(payload.predicate));
    });

    test("pushNamed", () async {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushNamed(payload);
      await delayed(() {
        verify(mockNavigationService.pushNamed(
          payload.name,
          arguments: payload.arguments,
        ));
      });
    });

    test("pushNamedAndRemoveUntil", () async {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPushNamedAndRemoveUntilPayload payload =
          NavigationPushNamedAndRemoveUntilPayload(
              name: "test",
              predicate: predicate,
              arguments: {
            "test": "test",
          });
      store.actions.navigation.pushNamedAndRemoveUntil(payload);
      await delayed(() {
        verify(mockNavigationService.pushNamedAndRemoveUntil(
          payload.name,
          payload.predicate,
          arguments: payload.arguments,
        ));
      });
    });

    test("pushReplacementNamed", () async {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushReplacementNamed(payload);
      await delayed(() {
        verify(mockNavigationService.pushReplacementNamed(
          payload.name,
          arguments: payload.arguments,
        ));
      });
    });

    test("removeHistoryAndPushNamed", () async {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.removeHistoryAndPushNamed(payload);
      await delayed(() {
        verify(mockNavigationService.pushNamedAndRemoveUntil(
          payload.name,
          any,
          arguments: payload.arguments,
        ));
      });
    });
  });

  group("guard", () {
    test("override", () async {
      store.actions.navigation.pushNamed(
        NavigationPushNamedPayload(name: "shouldBeOverriden"),
      );
      store.actions.navigation.pushNamedAndRemoveUntil(
        NavigationPushNamedAndRemoveUntilPayload(
            name: "shouldBeOverriden",
            predicate: (_) {
              return false;
            }),
      );
      store.actions.navigation.pushReplacementNamed(
        NavigationPushNamedPayload(name: "shouldBeOverriden"),
      );
      store.actions.navigation.removeHistoryAndPushNamed(
        NavigationPushNamedPayload(name: "shouldBeOverriden"),
      );
      await delayed(() {
        verify(
          mockNavigationService.pushNamed(
            "wasOverriden",
            arguments: anyNamed("arguments"),
          ),
        );
        verify(
          mockNavigationService.pushNamedAndRemoveUntil(
            "wasOverriden",
            any,
            arguments: anyNamed("arguments"),
          ),
        );
        verify(
          mockNavigationService.pushReplacementNamed(
            "wasOverriden",
            arguments: anyNamed("arguments"),
          ),
        );
      });
    });

    test("store state access", () async {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "shouldBeOverriden", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushNamed(payload);
      await delayed(() {
        verify(
          mockNavigationService.pushNamed(
            "wasOverriden",
            arguments: containsPair(
              "stateProp",
              _stateProp,
            ),
          ),
        );
      });
    });
  });

  group("service impl", () {
    NavigationService navigationService;
    MockNavigatorKey mockNavigatorKey;
    setUp(() {
      final MockNavigatorState mockNavigatorState = MockNavigatorState();
      mockNavigatorKey = MockNavigatorKey();
      when(mockNavigatorKey.currentState).thenAnswer((_) {
        return mockNavigatorState;
      });
      navigationService = NavigationServiceImpl(navigatorKey: mockNavigatorKey);
    });

    test("pop", () {
      navigationService.pop();
      final state = mockNavigatorKey.currentState;
      verify(state.pop());
    });

    test("popUntil", () {
      final RoutePredicate predicate = (_) {
        return false;
      };
      navigationService.popUntil(predicate);
      final state = mockNavigatorKey.currentState;
      verify(state.popUntil(predicate));
    });

    test("pushNamed", () {
      navigationService.pushNamed("test");
      final state = mockNavigatorKey.currentState;
      verify(state.pushNamed("test"));
    });

    test("pushNamedAndRemoveUntil", () {
      final RoutePredicate predicate = (_) {
        return false;
      };
      navigationService.pushNamedAndRemoveUntil("test", predicate);
      final state = mockNavigatorKey.currentState;
      verify(
        state.pushNamedAndRemoveUntil("test", predicate),
      );
    });

    test("pushReplacementNamed", () {
      navigationService.pushReplacementNamed("test");
      final state = mockNavigatorKey.currentState;
      verify(state.pushReplacementNamed("test"));
    });
  });

  group("no guards", () {
    setUp(() {
      store = Store<ExampleState, ExampleStateBuilder, ExampleActions>(
          ReducerBuilder<ExampleState, ExampleStateBuilder>().build(),
          ExampleState().rebuild((b) => b..exampleProp = _stateProp),
          ExampleActions(),
          middleware: [
            NavigationMiddleware<ExampleState, ExampleStateBuilder,
                ExampleActions>(
              navigationService: mockNavigationService,
            )()
          ]);
    });

    test("pop", () {
      store.actions.navigation.pop();
      verify(mockNavigationService.pop());
    });

    test("popUntil", () {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPopUntilPayload payload =
          NavigationPopUntilPayload(predicate: predicate);
      store.actions.navigation.popUntil(payload);
      verify(mockNavigationService.popUntil(payload.predicate));
    });

    test("pushNamed", () async {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushNamed(payload);
      await delayed(() {
        verify(mockNavigationService.pushNamed(
          payload.name,
          arguments: payload.arguments,
        ));
      });
    });

    test("pushNamedAndRemoveUntil", () async {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPushNamedAndRemoveUntilPayload payload =
          NavigationPushNamedAndRemoveUntilPayload(
              name: "test",
              predicate: predicate,
              arguments: {
            "test": "test",
          });
      store.actions.navigation.pushNamedAndRemoveUntil(payload);
      await delayed(() {
        verify(mockNavigationService.pushNamedAndRemoveUntil(
          payload.name,
          payload.predicate,
          arguments: payload.arguments,
        ));
      });
    });

    test("pushReplacementNamed", () async {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushReplacementNamed(payload);
      await delayed(() {
        verify(mockNavigationService.pushReplacementNamed(
          payload.name,
          arguments: payload.arguments,
        ));
      });
    });

    test("removeHistoryAndPushNamed", () async {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.removeHistoryAndPushNamed(payload);
      await delayed(() {
        verify(mockNavigationService.pushNamedAndRemoveUntil(
          payload.name,
          any,
          arguments: payload.arguments,
        ));
      });
    });
  });
}

Future<void> delayed(Function cb) async {
  await Future.delayed(Duration(milliseconds: 1));
  cb();
}
