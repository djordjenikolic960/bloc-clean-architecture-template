import '../../shared/constant.dart';
import '../bottom_navigation/bottom_navigation_screen.dart';
import '../home/home_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';
import '../splash/splash_screen.dart';

enum Routes {
  splash(SplashScreen),
  onboarding(OnboardingScreen),
  bottomNavigation(BottomNavigationScreen),
  home(HomeScreen),
  settings(SettingsScreen),
  profile(ProfileScreen);

  final Type _routeType;

  const Routes(this._routeType);

  String get routerName => "$_routeType";

  String get path {
    if (this == Routes.splash) {
      return Constant.slash;
    } else {
      return "${Constant.slash}$routerName";
    }
  }
}
