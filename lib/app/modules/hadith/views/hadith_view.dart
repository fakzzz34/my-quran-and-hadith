import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/provider/api_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/hadith_controller.dart';
import '../repository/hadith_repository.dart';

class HadithView extends GetView<HadithController> {
  const HadithView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(
      init: HadithController(
        HadithRepository(
          Get.find<ApiProvider>(),
        ),
      ),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Hadith'),
            centerTitle: true,
          ),
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.listHadithBook?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final data = controller.listHadithBook?.data?[index];
                    return Column(
                      children: [
                        ListTile(
                          onTap: () => Get.toNamed(
                            Routes.DETAIL_HADITH,
                            parameters: {
                              'hadithId': '${data?.id}',
                            },
                          ),
                          leading: Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: primarySecondary,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Text(
                                '${data?.name}'
                                    .replaceAll('HR. ', '')
                                    .substring(0, 1),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: neutralSurface,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            '${data?.name}',
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
                            '${data?.available}',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: neutralSecondary,
                            ),
                          ),

                          // trailing: Text(
                          //   '${data?.name?.short}',
                          //   style: GoogleFonts.amiri(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //     color: const Color(0XFF076C58),
                          //   ),
                          // ),
                        ),
                        const Divider(height: 0),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
