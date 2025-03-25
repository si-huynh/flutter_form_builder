// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_form_builder/screens/form_builder/form_builder_page.dart'
    as _i1;
import 'package:flutter_form_builder/screens/home/home_page.dart' as _i2;
import 'package:flutter_form_builder/screens/preview/preview_page.dart' as _i3;
import 'package:flutter_form_builder/screens/responses/responses_page.dart'
    as _i4;

/// generated route for
/// [_i1.FormBuilderPage]
class FormBuilderRoute extends _i5.PageRouteInfo<void> {
  const FormBuilderRoute({List<_i5.PageRouteInfo>? children})
    : super(FormBuilderRoute.name, initialChildren: children);

  static const String name = 'FormBuilderRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.FormBuilderPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.PreviewPage]
class PreviewRoute extends _i5.PageRouteInfo<void> {
  const PreviewRoute({List<_i5.PageRouteInfo>? children})
    : super(PreviewRoute.name, initialChildren: children);

  static const String name = 'PreviewRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.PreviewPage();
    },
  );
}

/// generated route for
/// [_i4.ResponsesPage]
class ResponsesRoute extends _i5.PageRouteInfo<void> {
  const ResponsesRoute({List<_i5.PageRouteInfo>? children})
    : super(ResponsesRoute.name, initialChildren: children);

  static const String name = 'ResponsesRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ResponsesPage();
    },
  );
}
