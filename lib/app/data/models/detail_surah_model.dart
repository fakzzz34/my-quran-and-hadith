class DetailSurah {
  num? code;
  String? status;
  String? message;
  Data? data;

  DetailSurah({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  DetailSurah.fromJson(Map<String, dynamic> json) {
    code = json['code'] as num?;
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['code'] = code;
    json['status'] = status;
    json['message'] = message;
    if (data != null) {
      json['data'] = data?.toJson();
    }
    return json;
  }
}

class Data {
  num? number;
  num? sequence;
  num? numberOfVerses;
  Name? name;
  Revelation? revelation;
  Tafsir? tafsir;
  PreBismillah? preBismillah;
  List<Verses>? verses;

  Data({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'] as num?;
    sequence = json['sequence'] as num?;
    numberOfVerses = json['numberOfVerses'] as num?;
    name = json['name'] != null ? Name?.fromJson(json['name']) : null;
    revelation = json['revelation'] != null
        ? Revelation?.fromJson(json['revelation'])
        : null;
    tafsir = json['tafsir'] != null ? Tafsir?.fromJson(json['tafsir']) : null;
    preBismillah = json['preBismillah'] != null
        ? PreBismillah?.fromJson(json['preBismillah'])
        : null;
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses?.add(Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['sequence'] = sequence;
    data['numberOfVerses'] = numberOfVerses;
    if (name != null) {
      data['name'] = name?.toJson();
    }
    if (revelation != null) {
      data['revelation'] = revelation?.toJson();
    }
    if (tafsir != null) {
      data['tafsir'] = tafsir?.toJson();
    }
    if (preBismillah != null) {
      data['preBismillah'] = preBismillah;
    }
    if (verses != null) {
      data['verses'] = verses?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String? short;
  String? long;
  Transliteration? transliteration;
  Transliteration? translation;

  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  Name.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
    transliteration = json['transliteration'] != null
        ? Transliteration?.fromJson(json['transliteration'])
        : null;
    translation = json['translation'] != null
        ? Transliteration?.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['short'] = short;
    data['long'] = long;
    if (transliteration != null) {
      data['transliteration'] = transliteration?.toJson();
    }
    if (translation != null) {
      data['translation'] = translation?.toJson();
    }
    return data;
  }
}

class Transliteration {
  String? en;
  String? id;

  Transliteration({
    this.en,
    this.id,
  });

  Transliteration.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['en'] = en;
    data['id'] = id;
    return data;
  }
}

class Revelation {
  String? arab;
  String? en;
  String? id;

  Revelation({
    this.arab,
    this.en,
    this.id,
  });

  Revelation.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['arab'] = arab;
    data['en'] = en;
    data['id'] = id;
    return data;
  }
}

class Tafsir {
  String? id;

  Tafsir({
    this.id,
  });

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class PreBismillah {
  Text? text;
  Transliteration? translation;
  Audio? audio;

  PreBismillah({
    this.text,
    this.translation,
    this.audio,
  });

  PreBismillah.fromJson(Map<String, dynamic> json) {
    text = json['text'] != null ? Text?.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Transliteration?.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? Audio?.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (text != null) {
      data['text'] = text?.toJson();
    }
    if (translation != null) {
      data['translation'] = translation?.toJson();
    }
    if (audio != null) {
      data['audio'] = audio?.toJson();
    }
    return data;
  }
}

class Verses {
  Number? number;
  Meta? meta;
  Text? text;
  Transliteration? translation;
  Audio? audio;
  TafsirData? tafsirData;

  Verses({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsirData,
  });

  Verses.fromJson(Map<String, dynamic> json) {
    number = json['number'] != null ? Number?.fromJson(json['number']) : null;
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
    text = json['text'] != null ? Text?.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Transliteration?.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? Audio?.fromJson(json['audio']) : null;
    tafsirData = json['tafsirData'] != null
        ? TafsirData?.fromJson(json['tafsir'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (number != null) {
      data['number'] = number?.toJson();
    }
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    if (text != null) {
      data['text'] = text?.toJson();
    }
    if (translation != null) {
      data['translation'] = translation?.toJson();
    }
    if (audio != null) {
      data['audio'] = audio?.toJson();
    }
    if (tafsirData != null) {
      data['tafsir'] = tafsirData?.toJson();
    }
    return data;
  }
}

class Number {
  num? inQuran;
  num? inSurah;

  Number({
    this.inQuran,
    this.inSurah,
  });

  Number.fromJson(Map<String, dynamic> json) {
    inQuran = json['inQuran'] as num?;
    inSurah = json['inSurah'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['inQuran'] = inQuran;
    data['inSurah'] = inSurah;
    return data;
  }
}

class Meta {
  num? juz;
  num? page;
  num? manzil;
  num? ruku;
  num? hizbQuarter;
  Sajda? sajda;

  Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    juz = json['juz'] as num?;
    page = json['page'] as num?;
    manzil = json['manzil'] as num?;
    ruku = json['ruku'] as num?;
    hizbQuarter = json['hizbQuarter'] as num?;
    sajda = json['sajda'] != null ? Sajda?.fromJson(json['sajda']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['juz'] = juz;
    data['page'] = page;
    data['manzil'] = manzil;
    data['ruku'] = ruku;
    data['hizbQuarter'] = hizbQuarter;
    if (sajda != null) {
      data['sajda'] = sajda?.toJson();
    }
    return data;
  }
}

class Sajda {
  bool? recommended;
  bool? obligatory;

  Sajda({
    this.recommended,
    this.obligatory,
  });

  Sajda.fromJson(Map<String, dynamic> json) {
    recommended = json['recommended'];
    obligatory = json['obligatory'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['recommended'] = recommended;
    data['obligatory'] = obligatory;
    return data;
  }
}

class Text {
  String? arab;
  Transliteration? transliteration;

  Text({
    this.arab,
    this.transliteration,
  });

  Text.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    transliteration = json['transliteration'] != null
        ? Transliteration?.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['arab'] = arab;
    if (transliteration != null) {
      data['transliteration'] = transliteration?.toJson();
    }
    return data;
  }
}

class Audio {
  String? primary;
  List<String>? secondary;

  Audio({
    this.primary,
    this.secondary,
  });

  Audio.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    return data;
  }
}

class TafsirData {
  Id? id;

  TafsirData({
    this.id,
  });

  TafsirData.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? Id?.fromJson(json['id']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id?.toJson();
    }
    return data;
  }
}

class Id {
  String? short;
  String? long;

  Id({
    this.short,
    this.long,
  });

  Id.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['short'] = short;
    data['long'] = long;
    return data;
  }
}
