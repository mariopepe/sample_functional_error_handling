import 'package:auto_route/auto_route.dart';
import 'package:meetup_app/presentation/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomePageRoute.page,
      initial: true,
      path: '/',
    ),
  ];
}
