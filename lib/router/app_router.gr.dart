// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_form_builder/screens/dashboard/dashboard_page.dart'
    as _i1;
import 'package:flutter_form_builder/screens/form_builder/form_builder_page.dart'
    as _i2;
import 'package:flutter_form_builder/screens/home/home_page.dart' as _i3;
import 'package:flutter_form_builder/screens/preview/preview_page.dart' as _i4;
import 'package:flutter_form_builder/screens/responses/responses_page.dart'
    as _i5;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.FormBuilderPage]
class FormBuilderRoute extends _i6.PageRouteInfo<void> {
  const FormBuilderRoute({List<_i6.PageRouteInfo>? children})
    : super(FormBuilderRoute.name, initialChildren: children);

  static const String name = 'FormBuilderRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i2.FormBuilderPage());
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i7.Key? key,
    required String formId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, formId: formId),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i3.HomePage(key: args.key, formId: args.formId);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.formId});

  final _i7.Key? key;

  final String formId;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, formId: $formId}';
  }
}

/// generated route for
/// [_i4.PreviewPage]
class PreviewRoute extends _i6.PageRouteInfo<void> {
  const PreviewRoute({List<_i6.PageRouteInfo>? children})
    : super(PreviewRoute.name, initialChildren: children);

  static const String name = 'PreviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i4.PreviewPage());
    },
  );
}

/// generated route for
/// [_i5.ResponsesPage]
class ResponsesRoute extends _i6.PageRouteInfo<void> {
  const ResponsesRoute({List<_i6.PageRouteInfo>? children})
    : super(ResponsesRoute.name, initialChildren: children);

  static const String name = 'ResponsesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i5.ResponsesPage());
    },
  );
}
