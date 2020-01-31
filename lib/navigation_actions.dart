library navigation_actions;

import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart' as widgets;
import 'package:meta/meta.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

part 'navigation_actions.g.dart';

abstract class NavigationActions extends ReduxActions {
  ActionDispatcher<NavigationPushNamedPayload> pushNamed;
  ActionDispatcher<NavigationPushNamedPayload> pushReplacementNamed;
  ActionDispatcher<widgets.BuildContext> pop;
  ActionDispatcher<NavigationPopUntilPayload> popUntil;
  ActionDispatcher<NavigationPushNamedAndRemoveUntilPayload>
      pushNamedAndRemoveUntil;
  ActionDispatcher<NavigationPushNamedPayload> removeHistoryAndPushNamed;

  NavigationActions._();

  factory NavigationActions() => _$NavigationActions();
}

abstract class NavigationPushNamedPayload
    implements
        NavigationPushRoute, Built<NavigationPushNamedPayload, NavigationPushNamedPayloadBuilder> {

  NavigationPushNamedPayload._();

  factory NavigationPushNamedPayload(
          {@required String name, Object arguments, widgets.BuildContext context}) =>
      _$NavigationPushNamedPayload._(
        name: name,
        arguments: arguments,
        context: context,
      );
}

abstract class NavigationPopUntilPayload
    implements
        Built<NavigationPopUntilPayload, NavigationPopUntilPayloadBuilder> {
  // Fields
  bool Function(material.Route<dynamic>) get predicate;
  @nullable
  widgets.BuildContext get context;

  NavigationPopUntilPayload._();

  factory NavigationPopUntilPayload({
    @required material.RoutePredicate predicate,
    widgets.BuildContext context,
  }) =>
      _$NavigationPopUntilPayload._(
        predicate: predicate,
        context: context,
      );
}

abstract class NavigationPushNamedAndRemoveUntilPayload
    implements NavigationPushRoute,
        Built<NavigationPushNamedAndRemoveUntilPayload,
            NavigationPushNamedAndRemoveUntilPayloadBuilder> {
  // Fields
  bool Function(material.Route<dynamic>) get predicate;
  @nullable
  widgets.BuildContext get context;

  NavigationPushNamedAndRemoveUntilPayload._();

  factory NavigationPushNamedAndRemoveUntilPayload({
    @required String name,
    @required material.RoutePredicate predicate,
    Object arguments,
  widgets.BuildContext context,
  }) =>
      _$NavigationPushNamedAndRemoveUntilPayload._(
        name: name,
        predicate: predicate,
        arguments: arguments,
        context: context,
      );
}

abstract class NavigationPushRoute {
  String get name;
  @nullable
  Object get arguments;
  @nullable
  widgets.BuildContext get context;
}
