class AyahModel {
  int? surahNumber;
  int? ayahNumberInQuran;
  int? ayahNumberInSurah;
  int? juzNumber;
  String? transliteration;
  String? arabic;
  String? translation;
  String? updatedAt;
  String? readType;

  AyahModel({
    this.surahNumber,
    this.ayahNumberInQuran,
    this.ayahNumberInSurah,
    this.juzNumber,
    this.transliteration,
    this.arabic,
    this.translation,
    this.updatedAt,
    this.readType,
  });

  factory AyahModel.fromJson(Map<String, dynamic> map) => AyahModel(
        surahNumber: map['surahNumber'],
        ayahNumberInSurah: map['ayahNumberInSurah'],
        ayahNumberInQuran: map['ayahNumberInQuran'],
        transliteration: map['transliteration'],
        arabic: map['arabic'],
        translation: map['translation'],
        updatedAt: map['updatedAt'],
        juzNumber: map['juzNumber'],
        readType: map['readType'],
      );

  Map<String, dynamic> toJson() => {
        'surahNumber': surahNumber,
        'ayahNumberInSurah': ayahNumberInSurah,
        'ayahNumberInQuran': ayahNumberInQuran,
        'transliteration': transliteration,
        'updatedAt': updatedAt,
        'arabic': arabic,
        'translation': translation,
        'juzNumber': juzNumber,
        'readType': readType,
      };
}
