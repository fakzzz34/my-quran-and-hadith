import 'ayah_model.dart';

class PlaylistModel {
  String? name;
  List<AyahModel>? ayahs;

  PlaylistModel({
    this.name,
    this.ayahs,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'ayahs': ayahs?.map((e) => e.toJson()).toList(),
      };
}
