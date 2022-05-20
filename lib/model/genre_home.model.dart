class MovieGenre {
  final int id;
  final String name;
  MovieGenre(
      this.id,
      this.name
      );
  MovieGenre.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"];
}