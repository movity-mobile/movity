import 'package:movity_app/model/genre.model.dart';

class SearchGenreList{
  List<Genre> genres;
  SearchGenreList(this.genres);

  SearchGenreList.fromJson(Map<String,dynamic> json) :

        genres = (json['genres'] as List).map((e) =>
            Genre.fromJson(e)).toList();
}


