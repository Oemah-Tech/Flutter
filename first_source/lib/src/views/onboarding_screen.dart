import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants/con_color.dart';
import '../utils/constants/con_path.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Lan",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                  ),
                  children: [
                    TextSpan(
                        text: "Lan",
                        style: GoogleFonts.pacifico(
                          color: ConColor.tertiaryColor,
                        )),
                  ]),
            )),
        const Gap(20),
        Stack(children: [
          Image.asset(
            "assets/images/background-splash-image.png",
            width: 400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Image.asset(
              "assets/images/discussing-image.png",
            ),
          ),
        ]),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: "Manage your task with",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.daysOne().fontFamily,
                ),
                children: [
                  TextSpan(
                      text: " Lan Lan",
                      style: TextStyle(color: ConColor.tertiaryColor)),
                ]),
          ),
        ),
      ])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: MaterialButton(
          color: ConColor.tertiaryColor,
          height: 50,
          minWidth: double.infinity,
          onPressed: () async {
            context.pushReplacement(ConPath.loginScreen);
          },
          child: const Text(
            "Get Started",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
