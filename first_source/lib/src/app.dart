import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/route_initializer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: "LanLan Application",
                routeInformationParser:
                    RouteInitializer.router.routeInformationParser,
                routerDelegate: RouteInitializer.router.routerDelegate,
                routeInformationProvider:
                    RouteInitializer.router.routeInformationProvider,
                theme: FlexThemeData.light(scheme: FlexScheme.greyLaw),
                themeMode: ThemeMode.system,
              )),
    );
  }
}
