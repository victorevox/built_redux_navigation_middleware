import 'package:built_redux_navigation_middleware/navigation_service.dart';
import 'package:flutter/material.dart';

class NavigationServiceImpl implements NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;// = new GlobalKey<NavigatorState>();

  NavigationServiceImpl({@required this.navigatorKey});

  Future<dynamic> pushNamed(String name, {Object arguments}) {
    return navigatorKey.currentState.pushNamed(name, arguments: arguments );
    // return navigatorKey.currentState.(name, arguments: arguments );
  }

  Future<dynamic> pushReplacementNamed(String name, {Object arguments}) {
    return navigatorKey.currentState.pushReplacementNamed(name, arguments: arguments );
  }

  Future<dynamic> pushNamedAndRemoveUntil(String name, RoutePredicate predicate, {Object arguments}) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(name, predicate, arguments: arguments);
  }

  void pop() {
    navigatorKey.currentState.pop();
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState.popUntil(predicate);
  }
}