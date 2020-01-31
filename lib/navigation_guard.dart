library navigation_guard;

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:built_redux_navigation_middleware/built_redux_navigation_middleware.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'navigation_guard.g.dart';

abstract class NavigationGuard<V extends Built<V, B>, B extends Builder<V, B>> {
  Future<GuardedPushedRoute> call(String name, Object arguments, V state);
}

abstract class GuardedPushedRoute
    implements
        NavigationPushRoute,
        Built<GuardedPushedRoute, GuardedPushedRouteBuilder> {
  @nullable
  String get originalName;
  @nullable
  Object get originalArguments;
  @override
  @nullable
  widgets.BuildContext get context;

  GuardedPushedRoute._();

  factory GuardedPushedRoute({
    @required name,
    Object arguments,
    originalName,
    originalArguments,
  }) =>
      _$GuardedPushedRoute._(
        name: name,
        originalName: originalName,
        originalArguments: originalArguments,
        arguments: arguments,
      );
}
