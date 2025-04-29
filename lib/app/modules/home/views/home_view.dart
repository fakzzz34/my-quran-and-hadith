import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/last_read_container.dart';
import '../../../widgets/menu_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Hafiz',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: primaryMain,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/ic_menu.svg'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/ic_search.svg'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FutureBuilder(
                //   future: controller.databaseService.getLastRead(),
                //   builder: (context, snapshot) {
                //     if (snapshot.data == null) return const SizedBox();
                //     return LastReadContainer(ayahModel: snapshot.data);
                //   },
                // ),
                LastReadContainer(ayahModel: controller.lastRead),
                const SizedBox(height: 33),
                Text(
                  'Popular',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryMain,
                  ),
                ),
                const SizedBox(height: 31),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    MenuContainer(
                      asset: 'assets/images/ic_quran.svg',
                      containerColor: greenSurface,
                      backgroundColor: greenMain,
                      name: 'Quran',
                      onTap: () => Get.toNamed(Routes.QURAN),
                    ),
                    MenuContainer(
                      asset: 'assets/images/ic_listening.svg',
                      containerColor: redSurface,
                      backgroundColor: redMain,
                      name: 'Playlist',
                      onTap: () => Get.toNamed(Routes.PLAYLIST),
                    ),
                    MenuContainer(
                      asset: 'assets/images/ic_test.svg',
                      containerColor: yellowSurface,
                      backgroundColor: yellowMain,
                      name: 'Bookmarks',
                      onTap: () {},
                    ),
                    MenuContainer(
                      asset: 'assets/images/ic_recite.svg',
                      containerColor: blueSurface,
                      backgroundColor: blueMain,
                      name: 'Hadith',
                      onTap: () => Get.toNamed(Routes.HADITH),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
