import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Transition {
  fade,
  none,
}

class RouteBuilder {
  static CustomTransitionPage transition(
      {LocalKey? key,
      String? name,
      Transition transition = Transition.fade,
      required Widget child}) {
    return CustomTransitionPage(
        key: key,
        name: name,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (transition) {
            case Transition.fade:
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInCirc).animate(animation),
                child: child,
              );

            case Transition.none:
              return child;
          }
        });
  }
}
