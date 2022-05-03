
class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  Genre.fromJson(Map<String, dynamic> genre) :
    id = genre['id'],
    name = genre['name'];

}
