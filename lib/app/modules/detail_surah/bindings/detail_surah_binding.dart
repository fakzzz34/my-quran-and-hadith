import 'package:get/get.dart';

import '../../../core/provider/api_provider.dart';
import '../controllers/detail_surah_controller.dart';
import '../repository/detail_surah_repository.dart';

class DetailSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSurahController>(
      () => DetailSurahController(
        DetailSurahRepository(
          Get.find<ApiProvider>(),
        ),
      ),
    );
  }
}
