import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/common/app_theme.dart';
import '../utils/constants/path_string.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacement(PathString.splashScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Image.asset(
          "assets/images/main_logo.png",
          width: 200,
        ),
      ),
    );
  }
}
