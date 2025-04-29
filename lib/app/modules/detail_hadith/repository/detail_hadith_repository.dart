import 'dart:convert';

import '../../../core/helper/exception_handler.dart';
import '../../../core/provider/api_provider.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/list_hadith_model.dart';

class DetailHadithRepository {
  ApiProvider api;
  DetailHadithRepository(this.api);

  Future<ListHadith> detailHadith(String name, int start, int end) =>
      api.hadithRange(name, start, end).then(
        (value) {
          return ListHadith.fromJson(
            isJSON(value.data) ? json.decode('${value.data}') : value.data,
          );
        },
      ).catchError(
        (e) {
          throw ExceptionHandler.handleError(e);
        },
      );
}
