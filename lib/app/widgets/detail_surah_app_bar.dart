import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_theme.dart';
import '../data/models/detail_surah_model.dart' as ds;

class DetailSurahAppBar extends StatelessWidget {
  final ds.DetailSurah? detailSurah;
  const DetailSurahAppBar({
    super.key,
    required this.detailSurah,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: -15,
            child: SvgPicture.asset(
              'assets/images/bg_quran.svg',
              width: 114,
              height: 146,
            ),
          ),
          Positioned(
            bottom: -30,
            right: -120,
            child: SvgPicture.asset(
              'assets/images/bg_container_2.svg',
              width: 622,
              height: 132,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: Get.back,
                        icon: const Icon(Icons.arrow_back_rounded),
                        iconSize: 24,
                        color: neutralSurface,
                      ),
                      Column(
                        children: [
                          Text(
                            '${detailSurah?.data?.name?.short}',
                            style: GoogleFonts.amiri(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: neutralSurface,
                            ),
                          ),
                          Text(
                            '${detailSurah?.data?.name?.transliteration?.en}',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: neutralSurface,
                            ),
                          ),
                          Text(
                            '${detailSurah?.data?.name?.translation?.id}',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: neutralSurface,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded),
                        iconSize: 24,
                        color: neutralSurface,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${detailSurah?.data?.revelation?.id}',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: neutralSurface,
                        ),
                      ),
                      Text(
                        'Juz ${detailSurah?.data?.verses?.first.meta?.juz} • ${detailSurah?.data?.numberOfVerses} Ayat',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: neutralSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
