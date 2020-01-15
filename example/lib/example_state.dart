library example_store;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'example_state.g.dart';

abstract class ExampleState implements Built<ExampleState, ExampleStateBuilder> {
  @nullable
  String get exampleProp;

  ExampleState._();

  factory ExampleState([void Function(ExampleStateBuilder) updates]) = _$ExampleState;
}