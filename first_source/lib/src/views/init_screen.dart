import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants/con_path.dart';

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
      context.pushReplacement(ConPath.splashScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? "assets/images/main-logo-dark.png"
              : "assets/images/main-logo-light.png",
          width: 200,
        ),
      ),
    );
  }
}
