import 'package:alga_blooms_center/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (s) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  'assets/images/logo-abc.jpeg',
                ),
              ),
            ),
            const SizedBox(height: 80),
            Text(
              'Alga Blooms Center',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 42, 85, 94),
              ),
            )
          ],
        ),
      ),
    );
  }
}
