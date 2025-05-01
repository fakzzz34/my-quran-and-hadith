import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/theme/app_theme.dart';
import '../data/models/detail_surah_model.dart' as ds;
import 'texts.dart';

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
                          Texts.heading(
                            '${detailSurah?.data?.name?.short}',
                            color: neutralSurface,
                            fontStyle: FontStyles.amiri,
                          ),
                          Texts.m(
                            '${detailSurah?.data?.name?.transliteration?.en}',
                            fontWeight: FontWeight.w500,
                            color: neutralSurface,
                          ),
                          Texts.s(
                            '${detailSurah?.data?.name?.translation?.id}',
                            fontWeight: FontWeight.w500,
                            color: neutralSurface,
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
                      Texts.m(
                        '${detailSurah?.data?.revelation?.id}',
                        fontWeight: FontWeight.w500,
                        color: neutralSurface,
                      ),
                      Texts.m(
                        'Juz ${detailSurah?.data?.verses?.first.meta?.juz} • ${detailSurah?.data?.numberOfVerses} Ayat',
                        fontWeight: FontWeight.w500,
                        color: neutralSurface,
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
