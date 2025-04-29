import 'dart:convert';

import '../../../core/helper/exception_handler.dart';
import '../../../core/provider/api_provider.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/list_hadith_book_model.dart';

class HadithRepository {
  ApiProvider api;
  HadithRepository(this.api);

  Future<ListHadithBook> listBook() => api.listBook().then(
        (response) {
          return ListHadithBook.fromJson(
            isJSON(response.data)
                ? json.decode('${response.data}')
                : response.data,
          );
        },
      ).catchError(
        (e) {
          throw ExceptionHandler.handleError(e);
        },
      );
}
