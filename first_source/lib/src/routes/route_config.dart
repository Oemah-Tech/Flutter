import 'package:go_router/go_router.dart';

import '../routes/route_builder.dart' as rb;
import '../utils/constants/path_string.dart';
import '../views/onboarding_screen.dart';
import '../views/splash_screen.dart';
import '../views/init_screen.dart';
import 'route_observer.dart';

class RouteConfig {
  static final router = GoRouter(observers: [
    RouteObserver()
  ], routes: [
    GoRoute(
        path: PathString.initScreen,
        pageBuilder: (context, state) => rb.RouteBuilder.transition(
            key: state.pageKey,
            name: "Initial Screen",
            transition: rb.Transition.none,
            child: const InitScreen())),
    GoRoute(
        path: PathString.splashScreen,
        pageBuilder: (context, state) => rb.RouteBuilder.transition(
            key: state.pageKey,
            name: "Splash Screen",
            child: const SplashScreen())),
    GoRoute(
      path: PathString.onboardingScreen,
      pageBuilder: (context, state) => rb.RouteBuilder.transition(
          key: state.pageKey,
          name: "Onboarding Screen",
          child: const OnboardingScreen()),
    )
  ]);
}
