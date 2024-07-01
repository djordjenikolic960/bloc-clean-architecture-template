import 'package:flutter_bloc/flutter_bloc.dart';

import '../article/article_screen.dart';
import '../article/bloc/article_bloc.dart';
import '../article/bloc/article_event.dart';
import '../di/service_locator.dart';
import '../forgot_password/bloc/forgot_password_bloc.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../login/bloc/login_bloc.dart';
import '../login/login_screen.dart';
import '../signup/bloc/signup_bloc.dart';
import '../signup/signup_screen.dart';
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
      _signUpRoute(),
      _loginRoute(),
      _forgotPasswordRoute(),
      _bottomNavigationRoute(),
      _articleRoute(),
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

  RouteBase _signUpRoute() => GoRoute(
        name: Routes.signUp.routerName,
        path: Routes.signUp.path,
        builder: (_, __) => BlocProvider<SignupBloc>(
          create: (_) => serviceLocator.get<SignupBloc>(),
          child: const SignupScreen(),
        ),
      );

  RouteBase _loginRoute() => GoRoute(
        name: Routes.login.routerName,
        path: Routes.login.path,
        builder: (_, __) => BlocProvider<LoginBloc>(
          create: (_) => serviceLocator.get<LoginBloc>(),
          child: const LoginScreen(),
        ),
      );

  RouteBase _forgotPasswordRoute() => GoRoute(
        name: Routes.forgotPassword.routerName,
        path: Routes.forgotPassword.path,
        builder: (_, __) => BlocProvider<ForgotPasswordBloc>(
          create: (_) => serviceLocator.get<ForgotPasswordBloc>(),
          child: const ForgotPasswordScreen(),
        ),
      );

  RouteBase _bottomNavigationRoute() => GoRoute(
        name: Routes.bottomNavigation.routerName,
        path: Routes.bottomNavigation.path,
        builder: (_, __) => const BottomNavigationScreen(),
      );

  RouteBase _articleRoute() => GoRoute(
        name: Routes.article.routerName,
        path: Routes.article.path,
        builder: (_, state) => BlocProvider<ArticleBloc>(
            create: (_) => serviceLocator.get<ArticleBloc>()
              ..add(
                  CheckArticleInDb((state.extra as ArticleScreenData).article)),
            child: ArticleScreen(
                articleScreenData: state.extra as ArticleScreenData)),
      );
}
