library example_actions;

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_redux_navigation_middleware/built_redux_navigation_middleware.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'example_actions.g.dart';

abstract class ExampleActions extends ReduxActions {
  NavigationActions get navigation;

  ExampleActions._();

  factory ExampleActions() => _$ExampleActions();
}