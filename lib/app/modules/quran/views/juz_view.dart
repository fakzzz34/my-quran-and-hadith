import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/values/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/read_type.dart';
import '../../../widgets/texts.dart';
import '../controllers/quran_controller.dart';

class JuzView extends GetView {
  const JuzView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(
      builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: juzDataList.length,
          itemBuilder: (context, index) {
            final data = juzDataList[index];
            return Column(
              children: [
                ListTile(
                  onTap: () => Get.toNamed(
                    Routes.DETAIL_JUZ,
                    parameters: {
                      'juzNumber': '${data.juz}',
                      'readType': ReadType.juz.name,
                    },
                  ),
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      Texts.s(
                        '${data.juz}',
                        fontWeight: FontWeight.w500,
                      ),
                      SvgPicture.asset('assets/images/bg_number.svg'),
                    ],
                  ),
                  title: Texts.m(
                    'Juz ${data.juz}',
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: Texts.m(
                    '${data.juzStartInfo} - ${data.juzEndInfo}',
                    fontWeight: FontWeight.w500,
                    color: neutralSecondary,
                  ),
                ),
                const Divider(height: 0),
              ],
            );
          },
        );
      },
    );
  }
}
