import 'package:go_router/go_router.dart';
import 'package:lan_lan/src/views/login_screen.dart';

import '../routes/route_builder.dart' as rb;
import '../utils/constants/con_path.dart';
import '../views/onboarding_screen.dart';
import '../views/splash_screen.dart';
import '../views/init_screen.dart';
import 'route_observer.dart' as ro;

class RouteInitializer {
  static final router = GoRouter(
    observers: [ro.RouteObserver()],
    routes: [
      GoRoute(
          path: ConPath.initScreen,
          pageBuilder: (context, state) => rb.RouteBuilder.transition(
              key: state.pageKey,
              name: "Initial Screen",
              transition: rb.RouteTransition.none,
              child: const InitScreen())),
      GoRoute(
          path: ConPath.splashScreen,
          pageBuilder: (context, state) => rb.RouteBuilder.transition(
              key: state.pageKey,
              name: "Splash Screen",
              transition: rb.RouteTransition.fade,
              child: const SplashScreen())),
      GoRoute(
        path: ConPath.onboardingScreen,
        pageBuilder: (context, state) => rb.RouteBuilder.transition(
            key: state.pageKey,
            name: "Onboarding Screen",
            transition: rb.RouteTransition.fade,
            child: const OnboardingScreen()),
      ),
      GoRoute(
        path: ConPath.loginScreen,
        pageBuilder: (context, state) => rb.RouteBuilder.transition(
            key: state.pageKey,
            name: "Login Screen",
            transition: rb.RouteTransition.fade,
            child: const LoginScreen()),
      ),
    ],
  );
}
