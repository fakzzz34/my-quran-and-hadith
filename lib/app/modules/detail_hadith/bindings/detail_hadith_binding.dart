import 'package:get/get.dart';

import '../../../core/provider/api_provider.dart';
import '../controllers/detail_hadith_controller.dart';
import '../repository/detail_hadith_repository.dart';

class DetailHadithBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHadithController>(
      () => DetailHadithController(
        DetailHadithRepository(
          Get.find<ApiProvider>(),
        ),
      ),
    );
  }
}
