import 'dart:convert';

import '../../../core/helper/exception_handler.dart';
import '../../../core/provider/api_provider.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/detail_surah_model.dart';

class DetailSurahRepository {
  ApiProvider api;
  DetailSurahRepository(this.api);

  Future<DetailSurah> detailSurah(int surah) => api.detailSurah(surah).then(
        (response) {
          return DetailSurah.fromJson(
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
