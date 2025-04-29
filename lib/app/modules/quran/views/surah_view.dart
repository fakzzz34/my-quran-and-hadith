import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/read_type.dart';
import '../controllers/quran_controller.dart';

class SurahView extends GetView {
  const SurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listSurah?.data?.length,
            itemBuilder: (context, index) {
              final data = controller.listSurah?.data?[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () => Get.toNamed(
                      Routes.DETAIL_SURAH,
                      parameters: {
                        'surahNumber': '${data?.number?.toInt()}',
                        'readType': ReadType.surah.name,
                      },
                    ),
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          '${data?.number}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SvgPicture.asset('assets/images/bg_number.svg'),
                      ],
                    ),
                    title: Text(
                      '${data?.name?.transliteration?.id}',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // subtitle: SubtitleMarquee(
                    //   revelation: data?.revelation?.id ?? '',
                    //   translation: data?.name?.translation?.id ?? '',
                    //   verseCount: data?.numberOfVerses?.toInt() ?? 0,
                    // ),

                    subtitle: Text(
                      '${data?.revelation?.id} • ${data?.name?.translation?.id} (${data?.numberOfVerses})',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: neutralSecondary,
                      ),
                    ),

                    trailing: Text(
                      '${data?.name?.short}',
                      style: GoogleFonts.amiri(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0XFF076C58),
                      ),
                    ),
                  ),
                  const Divider(height: 0),
                ],
              );
            },
          );
        }
      },
    );
  }
}
