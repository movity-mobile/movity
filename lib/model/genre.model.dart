
class Genre {
  int id;
  String name;

  Genre(this.id,this.name);

  Genre.fromJson(Map<String, dynamic> genre) :
    id = genre['id'],
    name = genre['name'];

}
