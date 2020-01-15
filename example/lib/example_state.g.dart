// GENERATED CODE - DO NOT MODIFY BY HAND

part of example_store;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExampleState extends ExampleState {
  @override
  final String exampleProp;

  factory _$ExampleState([void Function(ExampleStateBuilder) updates]) =>
      (new ExampleStateBuilder()..update(updates)).build();

  _$ExampleState._({this.exampleProp}) : super._();

  @override
  ExampleState rebuild(void Function(ExampleStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExampleStateBuilder toBuilder() => new ExampleStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExampleState && exampleProp == other.exampleProp;
  }

  @override
  int get hashCode {
    return $jf($jc(0, exampleProp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExampleState')
          ..add('exampleProp', exampleProp))
        .toString();
  }
}

class ExampleStateBuilder
    implements Builder<ExampleState, ExampleStateBuilder> {
  _$ExampleState _$v;

  String _exampleProp;
  String get exampleProp => _$this._exampleProp;
  set exampleProp(String exampleProp) => _$this._exampleProp = exampleProp;

  ExampleStateBuilder();

  ExampleStateBuilder get _$this {
    if (_$v != null) {
      _exampleProp = _$v.exampleProp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExampleState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExampleState;
  }

  @override
  void update(void Function(ExampleStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExampleState build() {
    final _$result = _$v ?? new _$ExampleState._(exampleProp: exampleProp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
