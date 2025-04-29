import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/provider/api_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../controllers/detail_hadith_controller.dart';
import '../repository/detail_hadith_repository.dart';

class DetailHadithView extends GetView<DetailHadithController> {
  const DetailHadithView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailHadithController>(
      init: DetailHadithController(
        DetailHadithRepository(
          Get.find<ApiProvider>(),
        ),
      ),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('DetailHadithView'),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: controller.listHadith?.data?.hadiths?.length ?? 0,
            itemBuilder: (context, index) {
              final data = controller.listHadith?.data?.hadiths?[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${data?.arab}',
                      style: GoogleFonts.amiri(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primaryMain,
                        height: 2,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      '${{data?.id}}',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: neutralSecondary,
                      ),
                    ),
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
