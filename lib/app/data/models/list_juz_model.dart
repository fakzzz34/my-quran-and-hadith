class ListJuz {
  num? code;
  String? status;
  String? message;
  List<ListJuzData>? data;

  ListJuz({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  ListJuz.fromJson(Map<String, dynamic> json) {
    code = json['code'] as num?;
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ListJuzData>[];
      json['data'].forEach((v) {
        data?.add(ListJuzData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['code'] = code;
    json['status'] = status;
    json['message'] = message;
    if (data != null) {
      json['data'] = data?.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class ListJuzData {
  num? juz;
  num? juzStartSurahNumber;
  num? juzEndSurahNumber;
  String? juzStartInfo;
  String? juzEndInfo;
  num? totalVerses;

  ListJuzData({
    this.juz,
    this.juzStartSurahNumber,
    this.juzEndSurahNumber,
    this.juzStartInfo,
    this.juzEndInfo,
    this.totalVerses,
  });

  ListJuzData.fromJson(Map<String, dynamic> json) {
    juz = json['juz'] as num?;
    juzStartSurahNumber = json['juzStartSurahNumber'] as num?;
    juzEndSurahNumber = json['juzEndSurahNumber'] as num?;
    juzStartInfo = json['juzStartInfo'];
    juzEndInfo = json['juzEndInfo'];
    totalVerses = json['totalVerses'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['juz'] = juz;
    data['juzStartSurahNumber'] = juzStartSurahNumber;
    data['juzEndSurahNumber'] = juzEndSurahNumber;
    data['juzStartInfo'] = juzStartInfo;
    data['juzEndInfo'] = juzEndInfo;
    data['totalVerses'] = totalVerses;
    return data;
  }
}
