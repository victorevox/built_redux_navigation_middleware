import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../example/lib/example.dart';

import 'package:built_redux_navigation_middleware/built_redux_navigation_middleware.dart';

// class MockNavigationMiddleware extends Mock implements NavigationMiddleware<ExampleStore, ExampleStoreBuilder, ExampleActions>{}
class MockNavigationService extends Mock implements NavigationService {}

class MockNavigatorKey extends Mock implements GlobalKey<NavigatorState> {}

class MockNavigatorState extends Mock implements NavigatorState {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return "";
  }
}

void main() {
  Store<ExampleStore, ExampleStoreBuilder, ExampleActions> store;
  NavigationService mockNavigationService;

  setUp(() {
    mockNavigationService = MockNavigationService();
    store = Store<ExampleStore, ExampleStoreBuilder, ExampleActions>(
        ReducerBuilder<ExampleStore, ExampleStoreBuilder>().build(),
        ExampleStore(),
        ExampleActions(),
        middleware: [
          NavigationMiddleware<ExampleStore, ExampleStoreBuilder,
              ExampleActions>(navigationService: mockNavigationService)()
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

    test("pushNamed", () {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushNamed(payload);
      verify(mockNavigationService.pushNamed(
        payload.name,
        arguments: payload.arguments,
      ));
    });

    test("pushNamedAndRemoveUntil", () {
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
      verify(mockNavigationService.pushNamedAndRemoveUntil(
        payload.name,
        payload.predicate,
        arguments: payload.arguments,
      ));
    });

    test("pushReplacementNamed", () {
      final RoutePredicate predicate = (_) {
        return false;
      };
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.pushReplacementNamed(payload);
      verify(mockNavigationService.pushReplacementNamed(
        payload.name,
        arguments: payload.arguments,
      ));
    });

    test("removeHistoryAndPushNamed", () {
      final NavigationPushNamedPayload payload =
          NavigationPushNamedPayload(name: "test", arguments: {
        "test": "test",
      });
      store.actions.navigation.removeHistoryAndPushNamed(payload);
      verify(mockNavigationService.pushNamedAndRemoveUntil(
        payload.name,
        any,
        arguments: payload.arguments,
      ));
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
      verify(state
          .pushNamedAndRemoveUntil("test", predicate),);
    });

    test("pushReplacementNamed", () {
      navigationService.pushReplacementNamed("test");
      final state = mockNavigatorKey.currentState;
      verify(state.pushReplacementNamed("test"));
    });
  });
}
