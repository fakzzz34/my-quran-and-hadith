import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/ayah_model.dart';
import '../../../data/models/detail_juz_model.dart';
import '../../../utils/read_type.dart';
import '../repository/detail_juz.dart';

class DetailJuzController extends GetxController {
  DetailJuzRepository repository;
  DetailJuzController(this.repository);

  // Finals
  final DatabaseService databaseService = DatabaseService.instance;
  final scrollController = ScrollController();
  final _duration = const Duration(milliseconds: 500);

  // Variables
  bool isLoading = false;
  String readType = '';

  int? currentJuz;
  int? lastRead;

  Timer? _debounce;

  // Models
  DetailJuz? detailJuz;

  // Functions

  _getListSurah(int surah) {
    isLoading = true;
    update();

    repository.detailJuz(surah).then(
      (value) {
        logSuccess('listSurah : ${value.toJson()}');
        detailJuz = value;

        currentJuz = detailJuz?.data?.juz?.toInt();
        isLoading = false;

        // Scroll to ayah by index, if it's passed as an argument

        if (lastRead != null) {
          _debounce = Timer(
            _duration,
            () {
              _scrollToAyahByIndex(lastRead!);
            },
          );
        }
        update();
      },
    ).catchError(
      (e) {
        isLoading = false;
        update();
        logError('QuranController | getListSurah | $e');
      },
    );
  }

  void next() {
    if (currentJuz! < 30) {
      _getListSurah(currentJuz! + 1);
    }
  }

  void previous() {
    if (currentJuz! > 1) {
      _getListSurah(currentJuz! - 1);
    }
  }

  getLastRead(JuzVerses? ayah) {
    _debounce?.cancel();

    _debounce = Timer(
      _duration,
      () {
        if (lastRead == null ||
            ayah!.number!.inSurah! > lastRead! ||
            (ayah.number!.inSurah! == lastRead &&
                ayah.number!.inSurah! > lastRead!)) {
          logSuccess(
              'Last Read  : ${detailJuz?.data?.juz} - ${ayah?.number?.inSurah} ');
          AyahModel ayahModel = AyahModel(
            ayahNumberInQuran: ayah?.number?.inQuran?.toInt(),
            ayahNumberInSurah: ayah?.number?.inSurah?.toInt(),
            surahNumber: detailJuz?.data?.juzStartSurahNumber?.toInt(),
            juzNumber: ayah?.meta?.juz?.toInt(),
            arabic: null,
            updatedAt: DateTime.now().toIso8601String(),
            transliteration:
                '${detailJuz?.data?.juzStartInfo} - ${detailJuz?.data?.juzEndInfo}',
            translation: null,
            readType: ReadType.juz.name,
          );

          logSuccess('ayahmodel : ${ayahModel.toJson()}');
          databaseService.updateLastRead(ayahModel);
        }
      },
    );
  }

  void _scrollToAyahByIndex(int index) {
    final key = GlobalObjectKey(index);
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: _duration,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    readType = Get.parameters['readType'] ?? '';

    lastRead = int.tryParse(Get.parameters['lastRead'] ?? '');

    currentJuz = int.parse(Get.parameters['juzNumber']!);
    _getListSurah(currentJuz!);
  }
}
