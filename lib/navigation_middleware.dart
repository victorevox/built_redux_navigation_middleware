import 'package:built_redux/built_redux.dart';
import 'package:built_redux_navigation_middleware/navigation_actions.dart';
import 'package:built_redux_navigation_middleware/navigation_service.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
// import 'package:flutter/material.dart';

class NavigationMiddleware<V extends Built<V, B>, B extends Builder<V, B>,
    A extends ReduxActions> {
  final NavigationService navigationService;

  NavigationMiddleware({
    @required this.navigationService,
  });

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
          ..add(NavigationActionsNames.removeHistoryAndPushNamed, removeHistoryAndPushNamed,)
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
  ) {
    // final payload = action.payload as NavigationPushNamedPayload;
    // Navigator.of(payload.context).pushNamed(payload.name);
    this
        .navigationService
        .pushNamed(action.payload.name, arguments: action.payload.arguments);
    next(action);
  }

  void pushReplacementNamed(
    MiddlewareApi<V, B, A> api,
    next,
    Action<NavigationPushNamedPayload> action,
  ) {
    this.navigationService.pushReplacementNamed(action.payload.name,
        arguments: action.payload.arguments);
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
  ) {
    this.navigationService.pushNamedAndRemoveUntil(
        action.payload.name, action.payload.predicate,
        arguments: action.payload.arguments);
    next(action);
  }

  void removeHistoryAndPushNamed(
    MiddlewareApi<V, B, A> api,
    next,
    Action<NavigationPushNamedPayload> action,
  ) {
    this.navigationService.pushNamedAndRemoveUntil(
      action.payload.name,
      (_) {
        return false;
      },
      arguments: action.payload.arguments,
    );
    next(action);
  }
}
