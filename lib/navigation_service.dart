import 'package:flutter/widgets.dart';

abstract class NavigationService {
  Future<dynamic> pushNamed(String name,
      {Object arguments, BuildContext context});

  Future<dynamic> pushReplacementNamed(String name,
      {Object arguments, BuildContext context});

  Future<dynamic> pushNamedAndRemoveUntil(String name, RoutePredicate predicate,
      {Object arguments, BuildContext context});

  void pop([BuildContext context]);

  void popUntil(bool Function(Route<dynamic>) predicate,
      [BuildContext context]);
}
