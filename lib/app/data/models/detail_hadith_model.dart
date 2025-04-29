class DetailHadith {
  num? code;
  String? message;
  Data? data;
  bool? error;

  DetailHadith({
    this.code,
    this.message,
    this.data,
    this.error,
  });

  DetailHadith.fromJson(Map<String, dynamic> json) {
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
  Contents? contents;

  Data({
    this.name,
    this.id,
    this.available,
    this.contents,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'] as num?;
    contents =
        json['contents'] != null ? Contents?.fromJson(json['contents']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['available'] = available;
    if (contents != null) {
      data['contents'] = contents?.toJson();
    }
    return data;
  }
}

class Contents {
  num? number;
  String? arab;
  String? id;

  Contents({
    this.number,
    this.arab,
    this.id,
  });

  Contents.fromJson(Map<String, dynamic> json) {
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
