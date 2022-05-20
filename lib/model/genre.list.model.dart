import 'package:movity_app/model/genre.model.dart';

class SearchGenreList {
  List<Genre> genres;

  SearchGenreList({required this.genres});

  SearchGenreList.fromJson(Map<String, dynamic> listGenres)
      : genres = (listGenres['genres'] as List).map(
          (user) => Genre.fromJson(user)
  ).toList();
}
