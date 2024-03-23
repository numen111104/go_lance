import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextChip extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  const TextChip(
      {super.key, required this.text, this.textColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          text,
          style: GoogleFonts.montserrat(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
