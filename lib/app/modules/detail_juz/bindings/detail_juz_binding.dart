import 'package:get/get.dart';

import '../../../core/provider/api_provider.dart';
import '../controllers/detail_juz_controller.dart';
import '../repository/detail_juz.dart';

class DetailJuzBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJuzController>(
      () => DetailJuzController(
        DetailJuzRepository(
          Get.find<ApiProvider>(),
        ),
      ),
    );
  }
}
