// GENERATED CODE - DO NOT MODIFY BY HAND

part of navigation_guard;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GuardedPushedRoute extends GuardedPushedRoute {
  @override
  final String originalName;
  @override
  final Object originalArguments;
  @override
  final String name;
  @override
  final Object arguments;

  factory _$GuardedPushedRoute(
          [void Function(GuardedPushedRouteBuilder) updates]) =>
      (new GuardedPushedRouteBuilder()..update(updates)).build();

  _$GuardedPushedRoute._(
      {this.originalName, this.originalArguments, this.name, this.arguments})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GuardedPushedRoute', 'name');
    }
  }

  @override
  GuardedPushedRoute rebuild(
          void Function(GuardedPushedRouteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GuardedPushedRouteBuilder toBuilder() =>
      new GuardedPushedRouteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GuardedPushedRoute &&
        originalName == other.originalName &&
        originalArguments == other.originalArguments &&
        name == other.name &&
        arguments == other.arguments;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, originalName.hashCode), originalArguments.hashCode),
            name.hashCode),
        arguments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GuardedPushedRoute')
          ..add('originalName', originalName)
          ..add('originalArguments', originalArguments)
          ..add('name', name)
          ..add('arguments', arguments))
        .toString();
  }
}

class GuardedPushedRouteBuilder
    implements Builder<GuardedPushedRoute, GuardedPushedRouteBuilder> {
  _$GuardedPushedRoute _$v;

  String _originalName;
  String get originalName => _$this._originalName;
  set originalName(String originalName) => _$this._originalName = originalName;

  Object _originalArguments;
  Object get originalArguments => _$this._originalArguments;
  set originalArguments(Object originalArguments) =>
      _$this._originalArguments = originalArguments;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Object _arguments;
  Object get arguments => _$this._arguments;
  set arguments(Object arguments) => _$this._arguments = arguments;

  GuardedPushedRouteBuilder();

  GuardedPushedRouteBuilder get _$this {
    if (_$v != null) {
      _originalName = _$v.originalName;
      _originalArguments = _$v.originalArguments;
      _name = _$v.name;
      _arguments = _$v.arguments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GuardedPushedRoute other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GuardedPushedRoute;
  }

  @override
  void update(void Function(GuardedPushedRouteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GuardedPushedRoute build() {
    final _$result = _$v ??
        new _$GuardedPushedRoute._(
            originalName: originalName,
            originalArguments: originalArguments,
            name: name,
            arguments: arguments);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
