import 'package:auto_route/auto_route.dart';
import 'package:global_test_project/features/auth/presentation/auth/auth_screen.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: AuthRoute.page, path: '/'),
      AutoRoute(page: MainRoute.page, path: '/main'),
    ];
  }
}
