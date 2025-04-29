import 'dart:convert';

import '../../../core/helper/exception_handler.dart';
import '../../../core/provider/api_provider.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/detail_juz_model.dart';

class DetailJuzRepository {
  ApiProvider api;
  DetailJuzRepository(this.api);

  Future<DetailJuz> detailJuz(int juz) => api.detailJuz(juz).then(
        (response) {
          return DetailJuz.fromJson(
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
