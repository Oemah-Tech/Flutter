import 'package:flutter/material.dart';

import '../utils/common/app_logger.dart';

class RouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    AppLogger.d("Route Pushed: ${route.settings.name}");
  }
}
