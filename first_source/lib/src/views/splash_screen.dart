import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lan_lan/src/utils/common/com_prefs.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../utils/constants/con_color.dart';
import '../utils/constants/con_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double _percent = 0.0;
  late bool isOnBoarding;

  final Duration _duration = const Duration(seconds: 5);

  void _startAnimate() {
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
          if (isOnBoarding == false) {
            context.pushReplacement(ConPath.onboardingScreen);
          } else {
            context.pushReplacement(ConPath.loginScreen);
          }
        }
      });
  }

  void _initializePrefs() async {
    isOnBoarding = await ComPrefs.getOnBoarding();
  }

  @override
  void initState() {
    super.initState();

    _initializePrefs();
    _startAnimate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? "assets/images/main-logo-dark.png"
                : "assets/images/main-logo-light.png",
            width: 200,
          ),
          const Gap(30),
          LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: MediaQuery.of(context).size.width - 60,
            lineHeight: 20.0,
            percent: _percent,
            center: Text("${(_percent * 100).toStringAsFixed(1)}%"),
            barRadius: const Radius.circular(10),
            progressColor: ConColor.tertiaryColor,
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
