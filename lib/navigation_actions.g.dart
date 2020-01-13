// GENERATED CODE - DO NOT MODIFY BY HAND

part of navigation_actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields
// ignore_for_file: type_annotate_public_apis

class _$NavigationActions extends NavigationActions {
  factory _$NavigationActions() => new _$NavigationActions._();
  _$NavigationActions._() : super._();

  final pushNamed = new ActionDispatcher<NavigationPushNamedPayload>(
      'NavigationActions-pushNamed');
  final pushReplacementNamed = new ActionDispatcher<NavigationPushNamedPayload>(
      'NavigationActions-pushReplacementNamed');
  final pop = new ActionDispatcher<void>('NavigationActions-pop');
  final popUntil = new ActionDispatcher<NavigationPopUntilPayload>(
      'NavigationActions-popUntil');
  final pushNamedAndRemoveUntil =
      new ActionDispatcher<NavigationPushNamedAndRemoveUntilPayload>(
          'NavigationActions-pushNamedAndRemoveUntil');
  final removeHistoryAndPushNamed =
      new ActionDispatcher<NavigationPushNamedPayload>(
          'NavigationActions-removeHistoryAndPushNamed');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    pushNamed.setDispatcher(dispatcher);
    pushReplacementNamed.setDispatcher(dispatcher);
    pop.setDispatcher(dispatcher);
    popUntil.setDispatcher(dispatcher);
    pushNamedAndRemoveUntil.setDispatcher(dispatcher);
    removeHistoryAndPushNamed.setDispatcher(dispatcher);
  }
}

class NavigationActionsNames {
  static final pushNamed =
      new ActionName<NavigationPushNamedPayload>('NavigationActions-pushNamed');
  static final pushReplacementNamed =
      new ActionName<NavigationPushNamedPayload>(
          'NavigationActions-pushReplacementNamed');
  static final pop = new ActionName<void>('NavigationActions-pop');
  static final popUntil =
      new ActionName<NavigationPopUntilPayload>('NavigationActions-popUntil');
  static final pushNamedAndRemoveUntil =
      new ActionName<NavigationPushNamedAndRemoveUntilPayload>(
          'NavigationActions-pushNamedAndRemoveUntil');
  static final removeHistoryAndPushNamed =
      new ActionName<NavigationPushNamedPayload>(
          'NavigationActions-removeHistoryAndPushNamed');
}

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigationPushNamedPayload extends NavigationPushNamedPayload {
  @override
  final String name;
  @override
  final Object arguments;

  factory _$NavigationPushNamedPayload(
          [void Function(NavigationPushNamedPayloadBuilder) updates]) =>
      (new NavigationPushNamedPayloadBuilder()..update(updates)).build();

  _$NavigationPushNamedPayload._({this.name, this.arguments}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('NavigationPushNamedPayload', 'name');
    }
  }

  @override
  NavigationPushNamedPayload rebuild(
          void Function(NavigationPushNamedPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationPushNamedPayloadBuilder toBuilder() =>
      new NavigationPushNamedPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationPushNamedPayload &&
        name == other.name &&
        arguments == other.arguments;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), arguments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationPushNamedPayload')
          ..add('name', name)
          ..add('arguments', arguments))
        .toString();
  }
}

class NavigationPushNamedPayloadBuilder
    implements
        Builder<NavigationPushNamedPayload, NavigationPushNamedPayloadBuilder> {
  _$NavigationPushNamedPayload _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Object _arguments;
  Object get arguments => _$this._arguments;
  set arguments(Object arguments) => _$this._arguments = arguments;

  NavigationPushNamedPayloadBuilder();

  NavigationPushNamedPayloadBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _arguments = _$v.arguments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationPushNamedPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationPushNamedPayload;
  }

  @override
  void update(void Function(NavigationPushNamedPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationPushNamedPayload build() {
    final _$result = _$v ??
        new _$NavigationPushNamedPayload._(name: name, arguments: arguments);
    replace(_$result);
    return _$result;
  }
}

class _$NavigationPopUntilPayload extends NavigationPopUntilPayload {
  @override
  final bool Function(material.Route<dynamic>) predicate;

  factory _$NavigationPopUntilPayload(
          [void Function(NavigationPopUntilPayloadBuilder) updates]) =>
      (new NavigationPopUntilPayloadBuilder()..update(updates)).build();

  _$NavigationPopUntilPayload._({this.predicate}) : super._() {
    if (predicate == null) {
      throw new BuiltValueNullFieldError(
          'NavigationPopUntilPayload', 'predicate');
    }
  }

  @override
  NavigationPopUntilPayload rebuild(
          void Function(NavigationPopUntilPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationPopUntilPayloadBuilder toBuilder() =>
      new NavigationPopUntilPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final _$dynamicOther = other as dynamic;
    return other is NavigationPopUntilPayload &&
        predicate == _$dynamicOther.predicate;
  }

  @override
  int get hashCode {
    return $jf($jc(0, predicate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationPopUntilPayload')
          ..add('predicate', predicate))
        .toString();
  }
}

class NavigationPopUntilPayloadBuilder
    implements
        Builder<NavigationPopUntilPayload, NavigationPopUntilPayloadBuilder> {
  _$NavigationPopUntilPayload _$v;

  bool Function(material.Route<dynamic>) _predicate;
  bool Function(material.Route<dynamic>) get predicate => _$this._predicate;
  set predicate(bool Function(material.Route<dynamic>) predicate) =>
      _$this._predicate = predicate;

  NavigationPopUntilPayloadBuilder();

  NavigationPopUntilPayloadBuilder get _$this {
    if (_$v != null) {
      _predicate = _$v.predicate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationPopUntilPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationPopUntilPayload;
  }

  @override
  void update(void Function(NavigationPopUntilPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationPopUntilPayload build() {
    final _$result =
        _$v ?? new _$NavigationPopUntilPayload._(predicate: predicate);
    replace(_$result);
    return _$result;
  }
}

class _$NavigationPushNamedAndRemoveUntilPayload
    extends NavigationPushNamedAndRemoveUntilPayload {
  @override
  final bool Function(material.Route<dynamic>) predicate;
  @override
  final String name;
  @override
  final Object arguments;

  factory _$NavigationPushNamedAndRemoveUntilPayload(
          [void Function(NavigationPushNamedAndRemoveUntilPayloadBuilder)
              updates]) =>
      (new NavigationPushNamedAndRemoveUntilPayloadBuilder()..update(updates))
          .build();

  _$NavigationPushNamedAndRemoveUntilPayload._(
      {this.predicate, this.name, this.arguments})
      : super._() {
    if (predicate == null) {
      throw new BuiltValueNullFieldError(
          'NavigationPushNamedAndRemoveUntilPayload', 'predicate');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError(
          'NavigationPushNamedAndRemoveUntilPayload', 'name');
    }
  }

  @override
  NavigationPushNamedAndRemoveUntilPayload rebuild(
          void Function(NavigationPushNamedAndRemoveUntilPayloadBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationPushNamedAndRemoveUntilPayloadBuilder toBuilder() =>
      new NavigationPushNamedAndRemoveUntilPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final _$dynamicOther = other as dynamic;
    return other is NavigationPushNamedAndRemoveUntilPayload &&
        predicate == _$dynamicOther.predicate &&
        name == other.name &&
        arguments == other.arguments;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, predicate.hashCode), name.hashCode), arguments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'NavigationPushNamedAndRemoveUntilPayload')
          ..add('predicate', predicate)
          ..add('name', name)
          ..add('arguments', arguments))
        .toString();
  }
}

class NavigationPushNamedAndRemoveUntilPayloadBuilder
    implements
        Builder<NavigationPushNamedAndRemoveUntilPayload,
            NavigationPushNamedAndRemoveUntilPayloadBuilder> {
  _$NavigationPushNamedAndRemoveUntilPayload _$v;

  bool Function(material.Route<dynamic>) _predicate;
  bool Function(material.Route<dynamic>) get predicate => _$this._predicate;
  set predicate(bool Function(material.Route<dynamic>) predicate) =>
      _$this._predicate = predicate;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Object _arguments;
  Object get arguments => _$this._arguments;
  set arguments(Object arguments) => _$this._arguments = arguments;

  NavigationPushNamedAndRemoveUntilPayloadBuilder();

  NavigationPushNamedAndRemoveUntilPayloadBuilder get _$this {
    if (_$v != null) {
      _predicate = _$v.predicate;
      _name = _$v.name;
      _arguments = _$v.arguments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationPushNamedAndRemoveUntilPayload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationPushNamedAndRemoveUntilPayload;
  }

  @override
  void update(
      void Function(NavigationPushNamedAndRemoveUntilPayloadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationPushNamedAndRemoveUntilPayload build() {
    final _$result = _$v ??
        new _$NavigationPushNamedAndRemoveUntilPayload._(
            predicate: predicate, name: name, arguments: arguments);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
