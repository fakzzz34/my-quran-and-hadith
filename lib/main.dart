import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/provider/api_provider.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(
        () async {
          Get.put(
            ApiProvider().init(),
            permanent: true,
          );
        },
      ),
    ),
  );
}
