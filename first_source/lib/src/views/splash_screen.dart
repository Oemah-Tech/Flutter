import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../utils/common/app_theme.dart';
import '../utils/constants/path_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  final Duration _duration = const Duration(seconds: 5);
  double _percent = 0.0;

  void startAnimate() {
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    )
      ..animateTo(
        1.0,
        duration: _duration,
        curve: Curves.linear,
      )
      ..addListener(() {
        setState(() {
          _percent = _controller!.value;
        });

        if (_percent == 1.0) {
          context.pushReplacement(PathString.onboardingScreen);
        }
      });
  }

  @override
  void initState() {
    super.initState();

    startAnimate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/main_logo.png",
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: MediaQuery.of(context).size.width - 60,
            lineHeight: 20.0,
            percent: _percent,
            center: Text("${(_percent * 100).toStringAsFixed(1)}%"),
            barRadius: const Radius.circular(10),
            progressColor: const Color(0xFF4D869C),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
