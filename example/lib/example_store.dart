library example_store;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'example_store.g.dart';

abstract class ExampleStore implements Built<ExampleStore, ExampleStoreBuilder> {
  // Fields

  ExampleStore._();

  factory ExampleStore([void Function(ExampleStoreBuilder) updates]) = _$ExampleStore;
}