import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Color borderColor;
  String hintText;
  IconData? prefixIcon;
  TextStyle? hintStyle;
  int? maxLines;

  CustomTextFormField(
      {super.key,
      required this.borderColor,
      required this.hintText,
      this.prefixIcon,
      this.hintStyle,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: borderColor,
      ),
      maxLines: maxLines,
    );
  }
}
