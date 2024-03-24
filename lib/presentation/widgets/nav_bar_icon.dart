import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarIcon extends StatelessWidget {
  final String text;
  final String iconAssetPath;
  final VoidCallback? onTap;
  const NavBarIcon({super.key, required this.text, required this.iconAssetPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(iconAssetPath),
          ),
          
        ),
         Text(text, style: GoogleFonts.montserrat(
          fontSize: 11, fontWeight: FontWeight.w600
         ) ,),
      ],
    );
  }
}