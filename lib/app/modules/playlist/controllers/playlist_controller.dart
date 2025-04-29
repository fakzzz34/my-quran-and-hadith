import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/database_service.dart';
import '../../../data/models/playlist_model.dart';

class PlaylistController extends GetxController {
  final DatabaseService databaseService = DatabaseService.instance;

  TextEditingController textField = TextEditingController();

  submitPlaylist() {
    if (textField.text.isEmpty) return;

    PlaylistModel playlist = PlaylistModel(
      name: textField.text,
      ayahs: [],
    );
    databaseService.insertPlaylist(playlist);

    textField.clear();
    update();
  }
}
