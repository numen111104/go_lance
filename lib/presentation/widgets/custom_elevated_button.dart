import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final double width;
  final double height;
  final FontWeight fontWeight;
  final double? fontSize;
  final VoidCallback? onPressed;
  const CustomButton(
      {super.key,
      required this.color,
      this.textColor = Colors.white,
      required this.text,
      this.width = double.infinity,
      required this.height,
      this.fontWeight = FontWeight.w600,
      this.onPressed,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),),),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              color: textColor, fontWeight: fontWeight, fontSize: fontSize),
        ),
      ),
    );
  }
}
