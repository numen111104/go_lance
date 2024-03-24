import 'package:flutter/material.dart';
import 'package:go_lance/presentation/color_pallete.dart';

class CustomFieldButton extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final String? hintText;
  final bool obscureText;
  const CustomFieldButton(
      {super.key,
      required this.controller,
      this.color = goLanceMagenta,
      this.hintText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: color,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}
