// To parse this JSON data, do
//
//     final quranVerse = quranVerseFromJson(jsonString);

import 'dart:convert';

QuranVerse quranVerseFromJson(String str) =>
    QuranVerse.fromJson(json.decode(str));

String quranVerseToJson(QuranVerse data) => json.encode(data.toJson());

class QuranVerse {
  List<Verse>? verses;
  Meta? meta;

  QuranVerse({
    this.verses,
    this.meta,
  });

  factory QuranVerse.fromJson(Map<String, dynamic> json) => QuranVerse(
        verses: json["verses"] == null
            ? []
            : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "verses": verses == null
            ? []
            : List<dynamic>.from(verses!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Meta {
  Filters? filters;

  Meta({
    this.filters,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        filters:
            json["filters"] == null ? null : Filters.fromJson(json["filters"]),
      );

  Map<String, dynamic> toJson() => {
        "filters": filters?.toJson(),
      };
}

class Filters {
  String? verseKey;
  String? chapterNumber;
  String? pageNumber;

  Filters({
    this.verseKey,
    this.chapterNumber,
    this.pageNumber,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        verseKey: json["verse_key"],
        chapterNumber: json["chapter_number"],
        pageNumber: json["page_number"],
      );

  Map<String, dynamic> toJson() => {
        "verse_key": verseKey,
        "chapter_number": chapterNumber,
        "page_number": pageNumber,
      };
}

class Verse {
  int? id;
  String? verseKey;
  String? textUthmani;

  Verse({
    this.id,
    this.verseKey,
    this.textUthmani,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        verseKey: json["verse_key"],
        textUthmani: json["text_uthmani"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_key": verseKey,
        "text_uthmani": textUthmani,
      };
}
