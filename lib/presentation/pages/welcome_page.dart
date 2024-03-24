import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_lance/presentation/assets.dart';
import 'package:go_lance/presentation/color_pallete.dart';
import 'package:go_lance/presentation/widgets/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
            fit: BoxFit.cover,
            image: AssetImage(Assets.bgpic),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.white.withOpacity(0.5)
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TOP
                    Column(
                      children: [
                        Image.asset(
                          Assets.logo,
                          width: 120,
                        ),
                        Text(
                          "Transforming Emergency Response with GoLance",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Join the GoLance Tech revolution",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CustomButton(
                          color: goLanceMagenta,
                          text: "Login",
                          height: 45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomButton(
                              color: Colors.white,
                              text: "Sign Up",
                              width: 120,
                              height: 35,
                              textColor: goLanceMagenta,
                            )
                          ],
                        ),
                      ],
                    )
                    //BOTTOM
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
