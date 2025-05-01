import 'dart:convert';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/models/ayah_model.dart';
import '../../data/models/bookmarks_model.dart';
import '../../data/models/playlist_model.dart';
import '../../data/models/read_model.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/quran/controllers/quran_controller.dart';
import '../values/constants.dart';

class DatabaseService {
  static Database? _db;

  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  final String _databaseName = 'database.db';

  final String _tableBookmarks = 'bookmarks';
  final String _tableReads = 'reads';
  final String _tableLastRead = 'last_read';
  final String _tablePlaylist = 'playlist';

  final String _columnId = 'id';
  final String _columnSurahNumber = 'surahNumber';
  final String _columnAyatNumberInQuran = 'ayahNumberInQuran';
  final String _columnAyatNumberInSurah = 'ayahNumberInSurah';
  final String _columnJuzNumber = 'juzNumber';
  final String _columnArabic = 'arabic';
  final String _columnTranslation = 'translation';
  final String _columnTransliteration = 'transliteration';
  final String _columnTafsir = 'tafsir';
  final String _columnReadAt = 'readAt';
  final String _columnUpdateAt = 'updatedAt';
  final String _columnName = 'name';
  final String _columnAyahs = 'ayahs';
  final String _ColumnReadType = 'readType';

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, _databaseName);
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableBookmarks (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_columnSurahNumber INTEGER,
            $_columnAyatNumberInQuran INTEGER,
            $_columnAyatNumberInSurah INTEGER,
            $_columnJuzNumber INTEGER,
            $_columnArabic TEXT,
            $_columnTranslation TEXT,
            $_columnTransliteration TEXT,
            $_columnTafsir TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $_tableReads (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $_columnSurahNumber INTEGER,
            $_columnAyatNumberInQuran INTEGER,
            $_columnAyatNumberInSurah INTEGER,
            $_columnJuzNumber INTEGER,
            $_columnReadAt TEXT,
            $_columnArabic TEXT,
            $_columnTranslation TEXT,
            $_columnTransliteration TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $_tableLastRead (
            $_columnId INTEGER PRIMARY KEY CHECK (id = 1),
            $_columnSurahNumber INTEGER,
            $_columnAyatNumberInQuran INTEGER,
            $_columnAyatNumberInSurah INTEGER,
            $_columnJuzNumber INTEGER,
            $_columnUpdateAt TEXT,
            $_columnArabic TEXT,
            $_columnTranslation TEXT,
            $_columnTransliteration TEXT,
            $_ColumnReadType TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $_tablePlaylist (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_columnName TEXT,
            $_columnAyahs TEXT
          )
        ''');
      },
    );

    return database;
  }

  Future<void> insertBookmark(AyahModel ayah) async {
    final db = await database;
    await db.insert(_tableBookmarks, ayah.toJson());
  }

  Future<void> toggleBookmark(BookmarkModel read) async {
    final db = await database;

    // Check if the data already exists
    final existing = await db.query(
      _tableBookmarks,
      where: 'ayahNumberInQuran = ?',
      whereArgs: [read.ayahNumberInQuran],
    );

    if (existing.isNotEmpty) {
      // Data exists — delete it
      await db.delete(
        _tableBookmarks,
        where: 'ayahNumberInQuran = ?',
        whereArgs: [read.ayahNumberInQuran],
      );
      logSuccess('toggleBookmark: deleted ${read.toJson()}');
    } else {
      // Data does not exist — insert it
      await db.insert(_tableBookmarks, read.toJson());
      logSuccess('toggleBookmark: inserted ${read.toJson()}');
    }
  }

  Future<List<BookmarkModel>> getBookmarks() async {
    final db = await database;
    final result = await db.query(_tableBookmarks);
    return result.map((e) => BookmarkModel.fromJson(e)).toList();
  }

  Future<void> updateLastRead(AyahModel ayah) async {
    final db = await database;
    await db.delete(_tableLastRead);
    await db.insert(_tableLastRead, ayah.toJson());
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().loadLastRead();
    }
    if (Get.isRegistered<QuranController>()) {
      Get.find<QuranController>().loadLastRead();
    }
  }

  Future<AyahModel?> getLastRead() async {
    try {
      final db = await database;
      final result = await db.query(_tableLastRead);
      return result.isNotEmpty ? AyahModel.fromJson(result.first) : null;
    } catch (e) {
      logError('Error : $e');
      return null;
    }
  }

  Future<void> insertRead(ReadModel read) async {
    final db = await database;
    await db.insert(_tableReads, read.toJson());

    logSuccess('insertRead: ${read.toJson()}');
  }

  Future<void> toggleRead(ReadModel read) async {
    final db = await database;

    // Check if the data already exists
    final existing = await db.query(
      _tableReads,
      where: 'ayahNumberInQuran = ?',
      whereArgs: [read.ayahNumberInQuran],
    );

    if (existing.isNotEmpty) {
      // Data exists — delete it
      await db.delete(
        _tableReads,
        where: 'ayahNumberInQuran = ?',
        whereArgs: [read.ayahNumberInQuran],
      );
      logSuccess('toggleRead: deleted ${read.toJson()}');
    } else {
      // Data does not exist — insert it
      await db.insert(_tableReads, read.toJson());
      logSuccess('toggleRead: inserted ${read.toJson()}');
    }
  }

  Future<List<ReadModel>> getReads() async {
    final db = await database;
    final result = await db.query(_tableReads);

    logSuccess('getReads: $result');
    return result.map((e) => ReadModel.fromJson(e)).toList();
  }

  Future<void> insertPlaylist(PlaylistModel playlist) async {
    final db = await database;
    await db.insert(_tablePlaylist, {
      _columnName: playlist.name,
      _columnAyahs: jsonEncode(playlist.ayahs?.map((e) => e.toJson()).toList()),
    });
  }

  Future<List<PlaylistModel>> getPlaylists() async {
    final db = await database;
    final result = await db.query(_tablePlaylist);

    logSuccess('playlist : $result');
    return result
        .map(
          (e) => PlaylistModel(
            name: e[_columnName] as String,
            ayahs: (jsonDecode(e[_columnAyahs] as String) as List)
                .map((x) => AyahModel.fromJson(x))
                .toList(),
          ),
        )
        .toList();
  }
}
