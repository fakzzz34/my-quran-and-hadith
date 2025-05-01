import 'ayah_model.dart';

class BookmarkModel extends AyahModel {
  final String? tafsir;

  BookmarkModel({
    super.surahNumber,
    super.ayahNumberInQuran,
    super.ayahNumberInSurah,
    super.juzNumber,
    super.arabic,
    super.translation,
    super.transliteration,
    this.tafsir,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      surahNumber: json['surahNumber'],
      ayahNumberInQuran: json['ayahNumberInQuran'],
      ayahNumberInSurah: json['ayahNumberInSurah'],
      juzNumber: json['juzNumber'],
      arabic: json['arabic'],
      translation: json['translation'],
      transliteration: json['transliteration'],
      tafsir: json['tafsir'],
    );
  }

  Map<String, dynamic> toJson() => {
        'surahNumber': surahNumber,
        'ayahNumberInQuran': ayahNumberInQuran,
        'ayahNumberInSurah': ayahNumberInSurah,
        'juzNumber': juzNumber,
        'arabic': arabic,
        'translation': translation,
        'transliteration': transliteration,
        'tafsir': tafsir,
      };

  AyahModel toAyahModel() {
    return AyahModel(
      surahNumber: surahNumber,
      ayahNumberInQuran: ayahNumberInQuran,
      ayahNumberInSurah: ayahNumberInSurah,
      juzNumber: juzNumber,
      arabic: arabic,
      translation: translation,
      transliteration: transliteration,
    );
  }
}
