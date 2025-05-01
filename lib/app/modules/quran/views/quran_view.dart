import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/provider/api_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/last_read_container.dart';
import '../../../widgets/texts.dart';
import '../controllers/quran_controller.dart';
import '../repository/quran_repository.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(
      init: QuranController(
        QuranRepository(
          Get.find<ApiProvider>(),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Texts.heading(
              'Quran',
              color: primaryMain,
            ),
            centerTitle: true,
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset('assets/images/ic_menu.svg'),
            // ),
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: SvgPicture.asset('assets/images/ic_search.svg'),
            //   ),
            // ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              LastReadContainer(ayahModel: controller.lastRead),
              const SizedBox(height: 24),
              TabBar(
                controller: controller.tabController,
                tabAlignment: TabAlignment.fill,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryBorder,
                ),
                indicatorWeight: 1,
                indicatorColor: primaryBorder,
                overlayColor: WidgetStateProperty.all(primarySurface),
                tabs: const [
                  Tab(text: 'Surah'),
                  Tab(text: 'Juz'),
                ],
                onTap: controller.tabOnChanged,
              ),
              IndexedStack(
                index: controller.selectedIndex,
                children: List.generate(
                  controller.tabs.length,
                  (index) => Visibility(
                    visible: controller.selectedIndex == index,
                    child: controller.tabs[index],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
