import 'package:built_redux/built_redux.dart';
import 'package:built_redux_navigation_middleware/navigation_actions.dart';
import 'package:built_redux_navigation_middleware/navigation_guard.dart';
import 'package:built_redux_navigation_middleware/navigation_service.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
// import 'package:flutter/material.dart';

class NavigationMiddleware<V extends Built<V, B>, B extends Builder<V, B>,
    A extends ReduxActions> {
  final NavigationService navigationService;
  List<NavigationGuard> _navigationGuards;

  NavigationMiddleware(
      {@required this.navigationService, navigationGuards}){
        _navigationGuards = navigationGuards?? [];
      }

  call() {
    return (MiddlewareBuilder<V, B, A>()
          ..add(NavigationActionsNames.pop, pop)
          ..add(
            NavigationActionsNames.pushNamed,
            pushNamed,
          )
          ..add(NavigationActionsNames.pushNamedAndRemoveUntil,
              pushNamedAndRemoveUntil)
          ..add(
            NavigationActionsNames.pushReplacementNamed,
            pushReplacementNamed,
          )
          ..add(
            NavigationActionsNames.removeHistoryAndPushNamed,
            removeHistoryAndPushNamed,
          )
          ..add(
            NavigationActionsNames.popUntil,
            popUntil,
          ))
        .build();
  }

  pushNamed(
    api,
    next,
    Action<NavigationPushNamedPayload> action,
  ) async {
    final data = await _applyGuard(action.payload, api.state);
    this.navigationService.pushNamed(data.name, arguments: data.arguments);
    next(action);
  }

  void pushReplacementNamed(
    MiddlewareApi<V, B, A> api,
    next,
    Action<NavigationPushNamedPayload> action,
  ) async {
    final data = await _applyGuard(action.payload, api.state);
    this.navigationService.pushReplacementNamed(
          data.name,
          arguments: data.arguments,
        );
    next(action);
  }

  void popUntil(
    MiddlewareApi<V, B, A> api,
    next,
    Action<NavigationPopUntilPayload> action,
  ) {
    this.navigationService.popUntil(action.payload.predicate);
    next(action);
  }

  void pop(
    MiddlewareApi<V, B, A> api,
    next,
    Action<void> action,
  ) {
    this.navigationService.pop();
    next(action);
  }

  void pushNamedAndRemoveUntil(
    MiddlewareApi<V, B, A> api,
    next,
    Action<NavigationPushNamedAndRemoveUntilPayload> action,
  ) async {
    final data = await _applyGuard(action.payload, api.state);
    this.navigationService.pushNamedAndRemoveUntil(
          action.payload.name,
          action.payload.predicate,
          arguments: data.arguments,
        );
    next(action);
  }

  void removeHistoryAndPushNamed(
    MiddlewareApi<V, B, A> api,
    next,
    Action<NavigationPushNamedPayload> action,
  ) async {
    final data = await _applyGuard(action.payload, api.state);
    this.navigationService.pushNamedAndRemoveUntil(
      data.name,
      (_) {
        return false;
      },
      arguments: data.arguments,
    );
    next(action);
  }

  Future<GuardedPushedRoute> _applyGuard(NavigationPushRoute route, V state) async {
    final String oringinalRoute = route.name;
    final Object originalArgs = route.arguments;
    GuardedPushedRoute newRoute = GuardedPushedRoute(name: oringinalRoute, arguments: originalArgs);
    if (_navigationGuards.length > 0) {
      final res = await Future.wait(_navigationGuards.map((guard) {
        return guard(route.name, route.arguments, state);
      }).toList());
      newRoute = res.last;
    }
    return GuardedPushedRoute(
      name: newRoute.name,
      arguments: newRoute.arguments,
      originalArguments: originalArgs,
      originalName: oringinalRoute,
    );
  }
}
