import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/ayah_model.dart';
import '../../../data/models/list_surah_model.dart';
import '../repository/quran_repository.dart';
import '../views/juz_view.dart';
import '../views/surah_view.dart';

class QuranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  QuranRepository repository;
  QuranController(this.repository);

  // Finals
  final DatabaseService databaseService = DatabaseService.instance;

  // Controllers
  TabController? tabController;

  // Models
  ListSurah? listSurah;
  AyahModel? lastRead;

  // Variables
  int selectedIndex = 0;
  bool isLoading = false;

  List<Widget> tabs = const [
    SurahView(),
    JuzView(),
  ];

  // Functions

  tabOnChanged(int index) {
    selectedIndex = index;
    update();
  }

  getListSurah() {
    isLoading = true;
    update();

    repository.listSurah().then(
      (value) {
        logSuccess('listSurah : ${value.toJson()}');
        listSurah = value;
        isLoading = false;
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

  void loadLastRead() async {
    lastRead = await databaseService.getLastRead();
    update();
  }

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);

    getListSurah();
    loadLastRead();
  }
}
