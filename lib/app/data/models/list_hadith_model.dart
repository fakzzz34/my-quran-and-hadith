class ListHadith {
  num? code;
  String? message;
  Data? data;
  bool? error;

  ListHadith({
    this.code,
    this.message,
    this.data,
    this.error,
  });

  ListHadith.fromJson(Map<String, dynamic> json) {
    code = json['code'] as num?;
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data?.toJson();
    }
    json['error'] = error;
    return json;
  }
}

class Data {
  String? name;
  String? id;
  num? available;
  num? requested;
  List<Hadiths>? hadiths;

  Data({
    this.name,
    this.id,
    this.available,
    this.requested,
    this.hadiths,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'] as num?;
    requested = json['requested'] as num?;
    if (json['hadiths'] != null) {
      hadiths = <Hadiths>[];
      json['hadiths'].forEach((v) {
        hadiths?.add(Hadiths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['available'] = available;
    data['requested'] = requested;
    if (hadiths != null) {
      data['hadiths'] = hadiths?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hadiths {
  num? number;
  String? arab;
  String? id;

  Hadiths({
    this.number,
    this.arab,
    this.id,
  });

  Hadiths.fromJson(Map<String, dynamic> json) {
    number = json['number'] as num?;
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['arab'] = arab;
    data['id'] = id;
    return data;
  }
}
