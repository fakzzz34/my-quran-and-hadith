class ListHadithBook {
  num? code;
  String? message;
  List<Data>? data;
  bool? error;

  ListHadithBook({
    this.code,
    this.message,
    this.data,
    this.error,
  });

  ListHadithBook.fromJson(Map<String, dynamic> json) {
    code = json['code'] as num?;
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data?.map((v) => v.toJson()).toList();
    }
    json['error'] = error;
    return json;
  }
}

class Data {
  String? name;
  String? id;
  num? available;

  Data({
    this.name,
    this.id,
    this.available,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['available'] = available;
    return data;
  }
}
