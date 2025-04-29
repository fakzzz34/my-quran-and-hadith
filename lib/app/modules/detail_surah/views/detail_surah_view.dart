import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/provider/api_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/detail_surah_app_bar.dart';
import '../controllers/detail_surah_controller.dart';
import '../repository/detail_surah_repository.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSurahController>(
      init: DetailSurahController(
        DetailSurahRepository(
          Get.find<ApiProvider>(),
        ),
      ),
      builder: (controller) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            body: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity != null) {
                  if (details.primaryVelocity! < 0) {
                    // Swipe left = next
                    controller.previous();
                  } else if (details.primaryVelocity! > 0) {
                    // Swipe right = previous
                    controller.next();
                  }
                }
              },
              child: controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        DetailSurahAppBar(detailSurah: controller.detailSurah),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: controller.scrollController,
                            child: SafeArea(
                              top: false,
                              child: Column(
                                children: [
                                  if (controller
                                          .detailSurah?.data?.preBismillah !=
                                      null)
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${controller.detailSurah?.data?.preBismillah?.text?.arab}',
                                            style: GoogleFonts.amiri(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: primaryMain,
                                              height: 2,
                                            ),
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.detailSurah?.data
                                            ?.verses?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      final data = controller
                                          .detailSurah?.data?.verses?[index];
                                      return VisibilityDetector(
                                        key: Key('ayah-$index'),
                                        onVisibilityChanged: (info) {
                                          if (info.visibleFraction > 0.6) {
                                            // c.updateLastRead(c.ayahList[i]);

                                            controller.getLastRead(data);
                                          }
                                        },
                                        child: Container(
                                          key: GlobalObjectKey(
                                              data!.number!.inQuran!),
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            border: index + 1 ==
                                                    controller.detailSurah?.data
                                                        ?.verses?.length
                                                ? null
                                                : const Border(
                                                    bottom: BorderSide(
                                                      width: 1,
                                                      color: Color(0XFFD9D8D8),
                                                    ),
                                                  ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                '${data.text?.arab}',
                                                style: GoogleFonts.amiri(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryMain,
                                                  height: 2,
                                                ),
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Text(
                                                  '${data.text?.transliteration?.en}',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: neutralSecondary,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  '${data.translation?.id}',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 4,
                                                        vertical: 2,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1,
                                                          color: const Color(
                                                              0XFF858585),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Text(
                                                        '${controller.detailSurah?.data?.number} : ${data.number?.inSurah}',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0XFF858585),
                                                        ),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    IconButton(
                                                      padding: EdgeInsets.zero,
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.check,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    IconButton(
                                                      padding: EdgeInsets.zero,
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      onPressed: () {},
                                                      icon: const Icon(Icons
                                                          .bookmark_border_rounded),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
