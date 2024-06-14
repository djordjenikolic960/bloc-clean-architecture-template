import 'router.dart' as app_router;
import 'routes.dart';
import 'package:go_router/go_router.dart';

import '../bottom_navigation/bottom_navigation_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../splash/splash_screen.dart';

/// router is used internally by library go router
class RouterImpl implements app_router.Router {
  late final GoRouter _router;

  RouterImpl(this._router);

  @override
  GoRouter getRouter() => _router;

  RouterImpl.defaultRouter() {
    _router = GoRouter(routes: [
      _splashRoute(),
      _onBoardingRoute(),
      _bottomNavigationRoute(),
    ]);
  }

  RouteBase _splashRoute() => GoRoute(
        name: Routes.splash.routerName,
        path: Routes.splash.path,
        builder: (_, __) => const SplashScreen(),
      );

  RouteBase _onBoardingRoute() => GoRoute(
        name: Routes.onboarding.routerName,
        path: Routes.onboarding.path,
        builder: (_, __) => const OnboardingScreen(),
      );

  RouteBase _bottomNavigationRoute() => GoRoute(
        name: Routes.bottomNavigation.routerName,
        path: Routes.bottomNavigation.path,
        builder: (_, __) => const BottomNavigationScreen(),
      );
}
