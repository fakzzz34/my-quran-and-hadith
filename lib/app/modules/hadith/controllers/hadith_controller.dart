import 'package:get/get.dart';

import '../../../core/helper/exception_handler.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/list_hadith_book_model.dart';
import '../repository/hadith_repository.dart';

class HadithController extends GetxController {
  HadithRepository repository;
  HadithController(this.repository);

  // Models
  ListHadithBook? listHadithBook;

  // Variables
  bool isLoading = false;

  // Funtions
  _listBook() {
    isLoading = true;
    update();
    repository.listBook().then((response) {
      listHadithBook = response;

      logSuccess('listHadithBook : ${listHadithBook?.toJson()}');

      isLoading = false;
      update();
    }).catchError(
      (e) {
        isLoading = false;
        update();
        throw ExceptionHandler.handleError(e);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();

    _listBook();
  }
}
