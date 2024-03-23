import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTabButton extends StatelessWidget {
  final String text;
  final bool isChoiced;
  final VoidCallback? onTap;
  const TextTabButton({super.key, required this.text, required this.isChoiced, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: isChoiced ? FontWeight.bold : FontWeight.w500,
          color: isChoiced ? Colors.black : Colors.grey,
        ),
      ),
      
    );
  }
}