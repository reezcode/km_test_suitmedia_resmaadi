import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:km_test_suitmedia_resmaadi/features/second_screen/presentation/pages/second_page.dart';
import 'package:km_test_suitmedia_resmaadi/features/third_screen/presentation/pages/third_page.dart';

import '../features/first_screen/presentation/pages/first_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@LazySingleton()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: FirstRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: SecondRoute.page,
          path: '/second',
        ),
        AutoRoute(
          page: ThirdRoute.page,
          path: '/third',
        )
      ];
}
