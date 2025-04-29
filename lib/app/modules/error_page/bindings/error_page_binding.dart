import 'package:get/get.dart';

import '../controllers/error_page_controller.dart';

class ErrorPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ErrorPageController>(
      () => ErrorPageController(),
    );
  }
}
