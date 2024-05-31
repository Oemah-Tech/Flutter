import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color/flutter_color.dart';

class FormCustom {
  FormCustom(
      {this.controller,
      this.inputFormatters,
      this.hintText,
      this.enabled,
      this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixTap,
      this.onChanged,
      this.validator});

  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  String? hintText;
  bool? enabled;
  bool? obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  void Function()? suffixTap;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

  Widget form() {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: _decoration(),
      onChanged: onChanged,
      validator: validator,
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      fillColor: HexColor("455A64"),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1, style: BorderStyle.solid)),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1, style: BorderStyle.solid)),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon != null
          ? InkWell(
              onTap: suffixTap,
              child: suffixIcon,
            )
          : null,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      errorStyle: const TextStyle(color: Colors.red),
    );
  }
}
