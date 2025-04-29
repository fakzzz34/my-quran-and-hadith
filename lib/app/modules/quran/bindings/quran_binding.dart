import 'package:get/get.dart';

import '../../../core/provider/api_provider.dart';
import '../controllers/quran_controller.dart';
import '../repository/quran_repository.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranController>(
      () => QuranController(
        QuranRepository(
          Get.find<ApiProvider>(),
        ),
      ),
    );
  }
}
