import 'package:flutter/material.dart';

import '../utils/common/com_logger.dart';

class RouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    ComLogger.d("Route Pushed: ${route.settings.name}");
  }
}
