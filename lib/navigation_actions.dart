library navigation_actions;

import 'package:flutter/material.dart' as material;
import 'package:meta/meta.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

part 'navigation_actions.g.dart';

abstract class NavigationActions extends ReduxActions {
  ActionDispatcher<NavigationPushNamedPayload> pushNamed;
  ActionDispatcher<NavigationPushNamedPayload> pushReplacementNamed;
  ActionDispatcher<void> pop;
  ActionDispatcher<NavigationPopUntilPayload> popUntil;
  ActionDispatcher<NavigationPushNamedAndRemoveUntilPayload>
      pushNamedAndRemoveUntil;
  ActionDispatcher<NavigationPushNamedPayload> removeHistoryAndPushNamed;

  NavigationActions._();

  factory NavigationActions() => _$NavigationActions();
}

abstract class NavigationPushNamedPayload
    implements
        Built<NavigationPushNamedPayload, NavigationPushNamedPayloadBuilder> {
  // Fields
  String get name;
  @nullable
  Object get arguments;

  NavigationPushNamedPayload._();

  factory NavigationPushNamedPayload(
          {@required String name, Object arguments}) =>
      _$NavigationPushNamedPayload._(
        name: name,
        arguments: arguments,
      );
}

abstract class NavigationPopUntilPayload
    implements
        Built<NavigationPopUntilPayload, NavigationPopUntilPayloadBuilder> {
  // Fields
  bool Function(material.Route<dynamic>) get predicate;

  NavigationPopUntilPayload._();

  factory NavigationPopUntilPayload({
    @required material.RoutePredicate predicate,
  }) =>
      _$NavigationPopUntilPayload._(
        predicate: predicate,
      );
}

abstract class NavigationPushNamedAndRemoveUntilPayload
    implements
        Built<NavigationPushNamedAndRemoveUntilPayload,
            NavigationPushNamedAndRemoveUntilPayloadBuilder> {
  // Fields
  bool Function(material.Route<dynamic>) get predicate;
  String get name;
  @nullable
  Object get arguments;

  NavigationPushNamedAndRemoveUntilPayload._();

  factory NavigationPushNamedAndRemoveUntilPayload({
    @required String name,
    @required material.RoutePredicate predicate,
    Object arguments,
  }) =>
      _$NavigationPushNamedAndRemoveUntilPayload._(
        name: name,
        predicate: predicate,
        arguments: arguments,
      );
}
