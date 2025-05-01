import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/texts.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarkController>(
      init: BookmarkController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Texts.heading(
              'Bookmark',
              color: primaryMain,
            ),
            centerTitle: true,
          ),
          body: controller.bookMarks.isEmpty
              ? Center(
                  child: Texts.l(
                    'Bookmark is empty',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyles.poppins,
                    color: primaryMain,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: controller.bookMarks.length,
                  itemBuilder: (context, index) {
                    final data = controller.bookMarks[index];
                    return Container(
                      margin: EdgeInsets.only(top: index == 0 ? 0 : 16),
                      height: 80,
                      decoration: BoxDecoration(
                        color: neutralSurface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAIL_SURAH,
                            arguments: data.toAyahModel(),
                            parameters: {
                              'lastRead': '${data.ayahNumberInQuran}',
                              'surahNumber': '${data.surahNumber}',
                              'readType': '${data.readType}',
                            },
                          );
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Texts.m(
                              '${data.transliteration}, Aya ${data.ayahNumberInSurah}',
                              fontWeight: FontWeight.w600,
                              color: primaryMain,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: primaryMain,
                            ),
                          ],
                        ),
                        subtitle: Texts.s(
                          '${data.tafsir}',
                          color: neutralSecondary,
                          maxLines: 2,
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
