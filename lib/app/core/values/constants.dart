import 'dart:convert';
import 'dart:developer';

import '../../data/models/list_juz_model.dart';

void logSuccess(String message) {
  log('\x1B[32m[SUCCESS] $message \x1B[0m');
}

void logError(String message) {
  log('\x1B[31m[ERROR] $message \x1B[0m');
}

void logWarning(String message) {
  log('\x1B[33m[WARNING] $message \x1B[0m');
}

void logInfo(String message) {
  log('\x1B[34m[INFO] $message \x1B[0m');
}

void logDebug(String message) {
  log('\x1B[36m[DEBUG] $message \x1B[0m');
}

bool isJSON(dynamic value) {
  try {
    json.decode(value);
    return true;
  } catch (e) {
    return false;
  }
}

List<ListJuzData> juzDataList = [
  ListJuzData(
      juz: 1, juzStartInfo: "Al-Fatihah (1)", juzEndInfo: "Al-Baqarah (141)"),
  ListJuzData(
      juz: 2, juzStartInfo: "Al-Baqarah (142)", juzEndInfo: "Al-Baqarah (252)"),
  ListJuzData(
      juz: 3, juzStartInfo: "Al-Baqarah (253)", juzEndInfo: "Ali Imran (92)"),
  ListJuzData(
      juz: 4, juzStartInfo: "Ali Imran (93)", juzEndInfo: "An-Nisa’ (23)"),
  ListJuzData(
      juz: 5, juzStartInfo: "An-Nisa’ (24)", juzEndInfo: "An-Nisa’ (147)"),
  ListJuzData(
      juz: 6, juzStartInfo: "An-Nisa’ (148)", juzEndInfo: "Al-Ma’idah (81)"),
  ListJuzData(
      juz: 7, juzStartInfo: "Al-Ma’idah (82)", juzEndInfo: "Al-An’am (110)"),
  ListJuzData(
      juz: 8, juzStartInfo: "Al-An’am (111)", juzEndInfo: "Al-A’raf (87)"),
  ListJuzData(
      juz: 9, juzStartInfo: "Al-A’raf (88)", juzEndInfo: "Al-Anfal (40)"),
  ListJuzData(
      juz: 10, juzStartInfo: "Al-Anfal (41)", juzEndInfo: "At-Taubah (92)"),
  ListJuzData(juz: 11, juzStartInfo: "At-Taubah (93)", juzEndInfo: "Hud (5)"),
  ListJuzData(juz: 12, juzStartInfo: "Hud (6)", juzEndInfo: "Yusuf (52)"),
  ListJuzData(juz: 13, juzStartInfo: "Yusuf (53)", juzEndInfo: "Ibrahim (52)"),
  ListJuzData(
      juz: 14, juzStartInfo: "Al-Hijr (1)", juzEndInfo: "An-Nahl (128)"),
  ListJuzData(juz: 15, juzStartInfo: "Al-Isra (1)", juzEndInfo: "Al-Kahf (74)"),
  ListJuzData(juz: 16, juzStartInfo: "Al-Kahf (75)", juzEndInfo: "Ta-Ha (135)"),
  ListJuzData(
      juz: 17, juzStartInfo: "Al-Anbiya (1)", juzEndInfo: "Al-Hajj (78)"),
  ListJuzData(
      juz: 18, juzStartInfo: "Al-Mu’minun (1)", juzEndInfo: "Al-Furqan (20)"),
  ListJuzData(
      juz: 19, juzStartInfo: "Al-Furqan (21)", juzEndInfo: "An-Naml (55)"),
  ListJuzData(
      juz: 20, juzStartInfo: "An-Naml (56)", juzEndInfo: "Al-Ankabut (45)"),
  ListJuzData(
      juz: 21, juzStartInfo: "Al-Ankabut (46)", juzEndInfo: "Al-Ahzab (30)"),
  ListJuzData(
      juz: 22, juzStartInfo: "Al-Ahzab (31)", juzEndInfo: "Ya-Sin (27)"),
  ListJuzData(
      juz: 23, juzStartInfo: "Ya-Sin (28)", juzEndInfo: "Az-Zumar (31)"),
  ListJuzData(
      juz: 24, juzStartInfo: "Az-Zumar (32)", juzEndInfo: "Fussilat (46)"),
  ListJuzData(
      juz: 25, juzStartInfo: "Fussilat (47)", juzEndInfo: "Al-Jathiyah (37)"),
  ListJuzData(
      juz: 26, juzStartInfo: "Al-Ahqaf (1)", juzEndInfo: "Az-Zariyat (30)"),
  ListJuzData(
      juz: 27, juzStartInfo: "Az-Zariyat (31)", juzEndInfo: "Al-Hadid (29)"),
  ListJuzData(
      juz: 28, juzStartInfo: "Al-Mujadilah (1)", juzEndInfo: "At-Tahrim (12)"),
  ListJuzData(
      juz: 29, juzStartInfo: "Al-Mulk (1)", juzEndInfo: "Al-Mursalat (50)"),
  ListJuzData(juz: 30, juzStartInfo: "An-Naba (1)", juzEndInfo: "An-Nas (6)"),
];
