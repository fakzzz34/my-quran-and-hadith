class VerseParameters {
  int? chapterNumber;
  String? verseNumber;

  get verseKey => verseNumber == null ? null : '$chapterNumber:$verseNumber';

  VerseParameters({
    this.chapterNumber,
    this.verseNumber,
  });

  VerseParameters.fromJson(Map<String, dynamic> json) {
    chapterNumber = json['chapter_number'];
    verseNumber = json['verse_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['chapter_number'] = chapterNumber;
    data['vers_number'] = verseNumber;
    data['verse_key'] = verseKey;
    return data..removeWhere((key, value) => value == null);
  }

  Map<String, dynamic> toQuery() {
    final data = <String, dynamic>{};
    data['chapter_number'] = chapterNumber;
    data['verse_key'] = verseKey;
    return data..removeWhere((key, value) => value == null);
  }
}
