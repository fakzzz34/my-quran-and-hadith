import 'ayah_model.dart';

class ReadModel extends AyahModel {
  String? readAt;

  ReadModel({
    super.surahNumber,
    super.ayahNumberInQuran,
    super.ayahNumberInSurah,
    super.juzNumber,
    this.readAt,
    super.arabic,
    super.translation,
    super.transliteration,
  });

  factory ReadModel.fromJson(Map<String, dynamic> map) => ReadModel(
        surahNumber: map['surahNumber'],
        ayahNumberInQuran: map['ayahNumberInQuran'],
        ayahNumberInSurah: map['ayahNumberInSurah'],
        juzNumber: map['juzNumber'],
        readAt: map['readAt'],
        arabic: map['arabic'],
        translation: map['translation'],
        transliteration: map['transliteration'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'surahNumber': surahNumber,
        'ayahNumberInQuran': ayahNumberInQuran,
        'ayahNumberInSurah': ayahNumberInSurah,
        'juzNumber': juzNumber,
        'readAt': readAt,
        'arabic': arabic,
        'translation': translation,
        'transliteration': transliteration,
      };
}
