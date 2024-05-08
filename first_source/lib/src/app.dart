import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/route_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: "LanLan Application",
              routeInformationParser: RouteConfig.router.routeInformationParser,
              routerDelegate: RouteConfig.router.routerDelegate,
              routeInformationProvider:
                  RouteConfig.router.routeInformationProvider,
              theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
              darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
              themeMode: ThemeMode.system,
            ));
  }
}
