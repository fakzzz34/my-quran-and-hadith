import 'package:get/get.dart';

import '../../../core/values/constants.dart';
import '../../../data/models/list_hadith_model.dart';
import '../repository/detail_hadith_repository.dart';

class DetailHadithController extends GetxController {
  DetailHadithRepository repository;
  DetailHadithController(this.repository);

  // Variables
  bool isLoading = false;

  String hadithId = '';

  final int maxItem = 10;

  int startItem = 1;
  int endItem = 10;

  // Models
  ListHadith? listHadith;

  // Functions
  getListhadith() {
    isLoading = true;
    update();
    repository.detailHadith(hadithId, startItem, endItem).then(
      (value) {
        listHadith = value;

        logSuccess('listHadith: ${listHadith?.toJson()}');
        isLoading = false;
        update();
      },
    ).catchError(
      (e) {
        isLoading = false;
        update();
        logError('getListhadith | $e');
      },
    );
  }

  next() {
    if (endItem < listHadith!.data!.available!) {
      startItem = startItem + maxItem;
      endItem = endItem + maxItem;
      if (endItem > listHadith!.data!.available!) {
        endItem = listHadith!.data!.available!.toInt();
      }
      getListhadith();
    }
  }

  previous() {
    if (endItem > maxItem) {
      startItem = startItem - maxItem;
      endItem = endItem - maxItem;
      getListhadith();
    }
  }

  @override
  void onInit() {
    super.onInit();

    hadithId = Get.parameters['hadithId'] ?? '';

    getListhadith();
  }
}
