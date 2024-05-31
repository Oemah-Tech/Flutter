import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouteTransition {
  fade,
  none,
}

class RouteBuilder {
  static final RouteBuilder _instance = RouteBuilder._internal();
  RouteBuilder._internal();
  factory RouteBuilder() => _instance;

  static CustomTransitionPage transition(
      {LocalKey? key,
      String? name,
      required RouteTransition transition,
      required Widget child}) {
    return CustomTransitionPage(
        key: key,
        name: name,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (transition) {
            case RouteTransition.fade:
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInCirc).animate(animation),
                child: child,
              );

            case RouteTransition.none:
              return child;
          }
        });
  }
}
