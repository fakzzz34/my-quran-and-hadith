import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/theme/app_theme.dart';
import '../data/models/ayah_model.dart';
import '../routes/app_pages.dart';
import '../utils/read_type.dart';
import 'button_with_arrow.dart';
import 'texts.dart';

class LastReadContainer extends StatelessWidget {
  final AyahModel? ayahModel;
  const LastReadContainer({super.key, this.ayahModel});

  @override
  Widget build(BuildContext context) {
    if (ayahModel == null) {
      return const SizedBox();
    } else {
      return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              child: SvgPicture.asset(
                'assets/images/bg_container.svg',
                height: 134.09,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/images/quran.svg',
                width: 180,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Texts.xs(
                            'Last Read',
                            color: neutralSurface,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(width: 8),
                          if (ayahModel?.updatedAt != null)
                            Texts.xs(
                              DateFormat('dd MMM yy').format(
                                  DateTime.parse('${ayahModel?.updatedAt}')),
                              color: neutralSurface,
                              fontWeight: FontWeight.normal,
                            ),
                        ],
                      ),
                      const SizedBox(height: 11),
                      ayahModel?.readType == ReadType.surah.name
                          ? Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Texts.xl(
                                    '${ayahModel?.arabic}',
                                    fontWeight: FontWeight.bold,
                                    color: neutralSurface,
                                    fontStyle: FontStyles.amiri,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Texts.xs(
                                  '${ayahModel?.transliteration}',
                                  color: neutralSurface,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            )
                          : Texts.xl(
                              'Juz ${ayahModel?.juzNumber}',
                              fontWeight: FontWeight.bold,
                              color: neutralSurface,
                              fontStyle: FontStyles.amiri,
                            ),
                      const SizedBox(height: 3),
                      Texts.xs(
                        'Ayah no. ${ayahModel?.ayahNumberInSurah}',
                        color: neutralSurface,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(height: 14),
                      ButtonWithArrow(
                        onPressed: () {
                          if (ayahModel?.readType == ReadType.surah.name) {
                            Get.toNamed(
                              Routes.DETAIL_SURAH,
                              arguments: ayahModel,
                              parameters: {
                                'lastRead': '${ayahModel?.ayahNumberInQuran}',
                                'surahNumber': '${ayahModel?.surahNumber}',
                                'readType': '${ayahModel?.readType}',
                              },
                            );
                          } else {
                            Get.toNamed(
                              Routes.DETAIL_JUZ,
                              arguments: ayahModel,
                              parameters: {
                                'lastRead': '${ayahModel?.ayahNumberInQuran}',
                                'juzNumber': '${ayahModel?.juzNumber}',
                                'readType': '${ayahModel?.readType}',
                              },
                            );
                          }
                        },
                        text: 'Continue',
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
