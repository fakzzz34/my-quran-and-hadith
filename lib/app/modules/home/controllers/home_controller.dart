import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../data/models/ayah_model.dart';

class HomeController extends GetxController {
  // Finals
  final DatabaseService databaseService = DatabaseService.instance;

  // Models
  AyahModel? lastRead;

  // Functions
  void loadLastRead() async {
    lastRead = await databaseService.getLastRead();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadLastRead();
  }
}
