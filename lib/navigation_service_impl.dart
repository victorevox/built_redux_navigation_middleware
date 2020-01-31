import 'package:built_redux_navigation_middleware/navigation_service.dart';
import 'package:flutter/material.dart';

class NavigationServiceImpl implements NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;// = new GlobalKey<NavigatorState>();

  NavigationServiceImpl({@required this.navigatorKey});

  Future<dynamic> pushNamed(String name, {Object arguments, BuildContext context}) {
    return _getNavigator(context).pushNamed(name, arguments: arguments );
  }

  Future<dynamic> pushReplacementNamed(String name, {Object arguments, BuildContext context}) {
    return _getNavigator(context).pushReplacementNamed(name, arguments: arguments );
  }

  Future<dynamic> pushNamedAndRemoveUntil(String name, RoutePredicate predicate, {Object arguments, BuildContext context}) {
    return _getNavigator(context).pushNamedAndRemoveUntil(name, predicate, arguments: arguments);
  }

  void pop([BuildContext context]) {
    _getNavigator(context).pop();
  }

  void popUntil(bool Function(Route<dynamic>) predicate, [BuildContext context]) {
    return _getNavigator(context).popUntil(predicate);
  }

  NavigatorState _getNavigator([BuildContext context]) {
    if(context != null) {
      return Navigator.of(context);
    }
    return navigatorKey.currentState;
  }
}