import 'dart:convert';

import '../../../core/helper/exception_handler.dart';
import '../../../core/provider/api_provider.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/detail_juz_model.dart';
import '../../../data/models/list_surah_model.dart';

class QuranRepository {
  ApiProvider api;
  QuranRepository(this.api);

  Future<ListSurah> listSurah() => api.listSurah().then(
        (response) {
          return ListSurah.fromJson(
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
