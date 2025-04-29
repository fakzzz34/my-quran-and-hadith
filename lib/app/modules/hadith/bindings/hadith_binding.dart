import 'package:get/get.dart';

import '../../../core/provider/api_provider.dart';
import '../controllers/hadith_controller.dart';
import '../repository/hadith_repository.dart';

class HadithBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadithController>(
      () => HadithController(
        HadithRepository(
          Get.find<ApiProvider>(),
        ),
      ),
    );
  }
}
