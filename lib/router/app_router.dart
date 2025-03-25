import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: 'builder',
              page: FormBuilderRoute.page,
            ),
            AutoRoute(
              path: 'preview',
              page: PreviewRoute.page,
            ),
            AutoRoute(
              path: 'responses',
              page: ResponsesRoute.page,
            ),
          ],
        ),
      ];
}
