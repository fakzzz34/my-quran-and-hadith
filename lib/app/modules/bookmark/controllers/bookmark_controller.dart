import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../data/models/bookmarks_model.dart';

class BookmarkController extends GetxController {
  final DatabaseService databaseService = DatabaseService.instance;

  // Models

  List<BookmarkModel> bookMarks = [];

  _getListBookmark() async {
    bookMarks = await databaseService.getBookmarks();
    update();
  }

  @override
  void onInit() {
    super.onInit();

    _getListBookmark();
  }
}
