import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/ayah_model.dart';
import '../../../data/models/bookmarks_model.dart';
import '../../../data/models/detail_surah_model.dart';
import '../../../data/models/read_model.dart';
import '../../../utils/read_type.dart';
import '../../quran/controllers/quran_controller.dart';
import '../repository/detail_surah_repository.dart';

class DetailSurahController extends GetxController {
  DetailSurahRepository repository;
  DetailSurahController(this.repository);

  final scrollController = ScrollController();
  final _duration = const Duration(milliseconds: 500);

  final DatabaseService databaseService = DatabaseService.instance;

  bool isLoading = false;

  String readType = '';

  int? currentSurah;
  int? currentJuz;
  int? lastRead;

  DetailSurah? detailSurah;

  List<ReadModel> completedRead = [];
  List<BookmarkModel> bookmark = [];

  Timer? _debounce;

  void _getListSurah(int surah) {
    isLoading = true;
    update();

    repository.detailSurah(surah).then(
      (value) {
        logSuccess('listSurah : ${value.toJson()}');
        detailSurah = value;

        currentSurah = detailSurah?.data?.number?.toInt();
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
    if (currentSurah! < 114) {
      _getListSurah(currentSurah! + 1);
    }
  }

  void previous() {
    if (currentSurah! > 1) {
      _getListSurah(currentSurah! - 1);
    }
  }

  void getLastRead(Verses? ayah) {
    _debounce?.cancel();

    _debounce = Timer(
      _duration,
      () {
        if (lastRead == null ||
            ayah!.number!.inSurah! > lastRead! ||
            (ayah.number!.inSurah! == lastRead &&
                ayah.number!.inSurah! > lastRead!)) {
          logSuccess(
              'Last Read  : ${detailSurah?.data?.name?.transliteration?.id} - ${ayah?.number?.inSurah} ');
          AyahModel ayahModel = AyahModel(
            ayahNumberInQuran: ayah?.number?.inQuran?.toInt(),
            ayahNumberInSurah: ayah?.number?.inSurah?.toInt(),
            surahNumber: detailSurah?.data?.number?.toInt(),
            juzNumber: ayah?.meta?.juz?.toInt(),
            arabic: detailSurah?.data?.name?.short,
            updatedAt: DateTime.now().toIso8601String(),
            transliteration: detailSurah?.data?.name?.transliteration?.id,
            translation: detailSurah?.data?.name?.translation?.id,
            readType: ReadType.surah.name,
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

  void togleRead(Verses? ayah) async {
    final readModel = ReadModel(
      ayahNumberInQuran: ayah?.number?.inQuran?.toInt(),
      ayahNumberInSurah: ayah?.number?.inSurah?.toInt(),
      surahNumber: detailSurah?.data?.number?.toInt(),
      juzNumber: ayah?.meta?.juz?.toInt(),
      arabic: detailSurah?.data?.name?.short,
      transliteration: detailSurah?.data?.name?.transliteration?.id,
      translation: detailSurah?.data?.name?.translation?.id,
    );

    await databaseService.toggleRead(readModel);
    await _getListCompletedRead();
    await Get.find<QuranController>().fetchCompletedReads();
    update();
  }

  _getListCompletedRead() async {
    completedRead = await databaseService.getReads();

    logSuccess('completedRead : $completedRead');
  }

  List<int> get completedReadIds =>
      completedRead.map((e) => e.ayahNumberInQuran!).toList();

  void toggleBookmark(Verses? ayah) async {
    final readModel = BookmarkModel(
      ayahNumberInQuran: ayah?.number?.inQuran?.toInt(),
      ayahNumberInSurah: ayah?.number?.inSurah?.toInt(),
      surahNumber: detailSurah?.data?.number?.toInt(),
      juzNumber: ayah?.meta?.juz?.toInt(),
      arabic: detailSurah?.data?.name?.short,
      transliteration: detailSurah?.data?.name?.transliteration?.id,
      translation: detailSurah?.data?.name?.translation?.id,
      tafsir: detailSurah?.data?.tafsir?.id,
    );

    await databaseService.toggleBookmark(readModel);
    await _getListBookmark();
    update();
  }

  _getListBookmark() async {
    bookmark = await databaseService.getBookmarks();
  }

  List<int> get bookmarkIds =>
      bookmark.map((e) => e.ayahNumberInQuran!).toList();

  @override
  void onInit() {
    super.onInit();

    readType = Get.parameters['readType'] ?? '';

    lastRead = int.tryParse(Get.parameters['lastRead'] ?? '');

    currentSurah = int.parse(Get.parameters['surahNumber']!);
    _getListSurah(currentSurah!);
    _getListCompletedRead();
    _getListBookmark();
  }
}
