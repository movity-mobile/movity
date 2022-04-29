
class Genre {
  int? id;
  String? name;

  Genre(this.id, this.name);

  factory Genre.fromJson(dynamic json) {
    if (json == null) {
      return Genre(0,"");
    }
    return Genre(json['id'], json['name']);
  }
}
