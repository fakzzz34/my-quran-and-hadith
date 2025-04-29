import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryMain,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SvgPicture.asset('assets/images/bg_top.svg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 391,
                margin: const EdgeInsets.symmetric(horizontal: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: primaryContainer,
                ),
                child: SvgPicture.asset('assets/images/quran.svg'),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: 210,
                child: Column(
                  children: [
                    Text(
                      'Hafiz',
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: primarySecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Learn Quran and Recite everyday',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: neutralSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Get.offNamed(Routes.HOME),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: neutralContainer,
                  ),
                  child: IntrinsicWidth(
                    child: Row(
                      children: [
                        Text(
                          'Get Started',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(width: 11),
                        SvgPicture.asset('assets/images/button_arrow.svg'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
