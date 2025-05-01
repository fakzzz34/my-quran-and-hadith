import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/provider/api_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/texts.dart';
import '../controllers/detail_juz_controller.dart';
import '../repository/detail_juz.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  const DetailJuzView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailJuzController>(
      init: DetailJuzController(
        DetailJuzRepository(
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
                        // detailJuzAppBar(detailJuz: controller.detailJuz),
                        Container(
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: Get.back,
                                            icon: const Icon(
                                                Icons.arrow_back_rounded),
                                            iconSize: 24,
                                            color: neutralSurface,
                                          ),
                                          Column(
                                            children: [
                                              Texts.heading(
                                                'Juz ${controller.detailJuz?.data?.juz}',
                                                color: neutralSurface,
                                                fontStyle: FontStyles.amiri,
                                              ),
                                              Texts.s(
                                                '${controller.detailJuz?.data?.totalVerses} Ayat',
                                                fontWeight: FontWeight.w500,
                                                color: neutralSurface,
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.more_vert_rounded),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Texts.m(
                                            '${controller.detailJuz?.data?.juzStartInfo}',
                                            fontWeight: FontWeight.w500,
                                            color: neutralSurface,
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: neutralSurface),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Texts.m(
                                            '${controller.detailJuz?.data?.juzEndInfo}',
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
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: controller.scrollController,
                            child: SafeArea(
                              top: false,
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller
                                            .detailJuz?.data?.verses?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      final data = controller
                                          .detailJuz?.data?.verses?[index];
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
                                                    controller.detailJuz?.data
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
                                              Texts.xl(
                                                '${data.text?.arab}',
                                                fontWeight: FontWeight.bold,
                                                color: primaryMain,
                                                height: 2,
                                                fontStyle: FontStyles.amiri,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Texts.s(
                                                  '${data.text?.transliteration?.en}',
                                                  fontWeight: FontWeight.w500,
                                                  color: neutralSecondary,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Texts.m(
                                                  '${data.translation?.id}',
                                                  fontWeight: FontWeight.w500,
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
                                                      child: Texts.xs(
                                                        '${controller.detailJuz?.data?.juz} : ${data.number?.inSurah}',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0XFF858585),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    // IconButton(
                                                    //   padding: EdgeInsets.zero,
                                                    //   visualDensity:
                                                    //       VisualDensity.compact,
                                                    //   onPressed: () {},
                                                    //   icon: const Icon(
                                                    //     Icons.check,
                                                    //   ),
                                                    // ),
                                                    // const SizedBox(width: 8),
                                                    IconButton(
                                                      padding: EdgeInsets.zero,
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons
                                                            .bookmark_border_rounded,
                                                        color: neutralSecondary,
                                                      ),
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
