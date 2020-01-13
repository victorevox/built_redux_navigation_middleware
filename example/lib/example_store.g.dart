// GENERATED CODE - DO NOT MODIFY BY HAND

part of example_store;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExampleStore extends ExampleStore {
  factory _$ExampleStore([void Function(ExampleStoreBuilder) updates]) =>
      (new ExampleStoreBuilder()..update(updates)).build();

  _$ExampleStore._() : super._();

  @override
  ExampleStore rebuild(void Function(ExampleStoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExampleStoreBuilder toBuilder() => new ExampleStoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExampleStore;
  }

  @override
  int get hashCode {
    return 112176490;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ExampleStore').toString();
  }
}

class ExampleStoreBuilder
    implements Builder<ExampleStore, ExampleStoreBuilder> {
  _$ExampleStore _$v;

  ExampleStoreBuilder();

  @override
  void replace(ExampleStore other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExampleStore;
  }

  @override
  void update(void Function(ExampleStoreBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExampleStore build() {
    final _$result = _$v ?? new _$ExampleStore._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
