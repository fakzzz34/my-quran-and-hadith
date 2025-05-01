import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/read_type.dart';
import '../../../widgets/texts.dart';
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
                        'surahNumber': '${data.number?.toInt()}',
                        'readType': ReadType.surah.name,
                      },
                    ),
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Texts.s(
                          '${data?.number}',
                          fontWeight: FontWeight.w500,
                        ),
                        SvgPicture.asset('assets/images/bg_number.svg'),
                      ],
                    ),
                    title: Texts.m(
                      '${data?.name?.transliteration?.id}',
                      fontWeight: FontWeight.w500,
                    ),
                    subtitle: Texts.m(
                      '${data?.revelation?.id} • ${data?.name?.translation?.id} (${data?.numberOfVerses})',
                      fontWeight: FontWeight.w500,
                      color: neutralSecondary,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Texts.l(
                          '${data?.name?.short}',
                          fontWeight: FontWeight.bold,
                          color: const Color(0XFF076C58),
                          fontStyle: FontStyles.amiri,
                        ),
                        Texts.xs(
                          '${controller.getCompletedReadCountForSurah(data!.number!.toInt())} / ${data.numberOfVerses?.toInt()}',
                          color: neutralSecondary,
                        ),
                      ],
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
