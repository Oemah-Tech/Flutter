import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lan_lan/src/components/form_custom.dart';
import 'package:lan_lan/src/utils/common/com_logger.dart';

import 'package:lan_lan/src/utils/extensions/ext_string.dart';

import '../utils/common/com_prefs.dart';
import '../utils/constants/con_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isObscure = true;

  void _scrollToBottom() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (visible) {
        ComLogger.d("Keyboard is visible");
        Future.delayed(const Duration(milliseconds: 200), () {
          _scrollToBottom();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/background-header-image.png",
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login Here",
                          style: TextStyle(
                              color: ConColor.tertiaryColor,
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                        const Gap(12),
                        const Text(
                          "Welcome back you've been missed!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(30),
                        formField(
                            controller: _emailController,
                            title: "Email Address",
                            hint: "Enter your email address",
                            iconValue: "assets/icons/usertag-icon.png",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email address";
                              }

                              if (!value.isValidEmail()) {
                                return "Please enter a valid email address";
                              }

                              return null;
                            }),
                        const Gap(25),
                        formField(
                            controller: _passwordController,
                            title: "Password",
                            hint: "Enter your password",
                            iconValue: "assets/icons/lock-icon.png",
                            isObscure: _isObscure,
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }

                              return null;
                            }),
                        const Gap(40),
                        button(onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ComPrefs.setOnBoarding(true);
                          }
                        }),
                        textButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formField(
      {required TextEditingController controller,
      required String title,
      required String hint,
      required String iconValue,
      bool? isObscure,
      void Function()? onTap,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const Gap(14),
        FormCustom(
                controller: controller,
                obscureText: isObscure,
                hintText: hint,
                prefixIcon: Image.asset(
                  iconValue,
                  alignment: Alignment.center,
                  scale: 1.7,
                ),
                suffixIcon: isObscure != null
                    ? isObscure == true
                        ? const Icon(
                            Iconsax.eye_slash,
                            color: Colors.grey,
                            size: 22,
                          )
                        : const Icon(
                            Iconsax.eye,
                            color: Colors.grey,
                            size: 22,
                          )
                    : null,
                suffixTap: onTap,
                validator: validator)
            .form(),
      ],
    );
  }

  Widget button({
    void Function()? onPressed,
  }) {
    return MaterialButton(
        color: ConColor.tertiaryColor,
        height: 50,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  Widget textButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(color: ConColor.tertiaryColor, fontSize: 14),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
