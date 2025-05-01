import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/ayah_model.dart';

class HomeController extends GetxController {
  // Finals
  final DatabaseService databaseService = DatabaseService.instance;

  // Models
  AyahModel? lastRead;

  // Functions
  void loadLastRead() async {
    try {
      lastRead = await databaseService.getLastRead();
      update();
    } catch (e) {
      logError('Error : $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadLastRead();
  }
}
