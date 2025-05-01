import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/button_with_arrow.dart';
import '../../../widgets/texts.dart';
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
                    // Text(
                    //   'My Quran & Hadith',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.bold,
                    //     color: primarySecondary,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    Texts.heading(
                      'My Quran & Hadith',
                      color: primarySecondary,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // Text(
                    //   'Read Quran and Hadith everyday',
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //     color: neutralSurface,
                    //   ),
                    // ),
                    Texts.xl(
                      'Read Quran and Hadith everyday',
                      fontWeight: FontWeight.bold,
                      color: neutralSurface,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              ButtonWithArrow(
                onPressed: () => Get.offNamed(Routes.HOME),
                text: 'Get Started',
                buttonWithArrowSize: ButtonWithArrowSize.large,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
