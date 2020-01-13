import 'package:flutter/widgets.dart';

abstract class NavigationService {
  Future<dynamic> pushNamed(String name, {Object arguments});

  Future<dynamic> pushReplacementNamed(String name, {Object arguments});

  Future<dynamic> pushNamedAndRemoveUntil(
    String name,
    RoutePredicate predicate, {
    Object arguments,
  });

  bool pop();

  void popUntil(bool Function(Route<dynamic>) predicate);
}
