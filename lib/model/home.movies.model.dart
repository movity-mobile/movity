class HomeMovie {
  final int id;
  final  num popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final num rating;

  HomeMovie(this.id,
      this.popularity,
      this.title,
      this.backPoster,
      this.poster,
      this.overview,
      this.rating
      );
  HomeMovie.fromJson(Map<String, dynamic> json):
    id = json["id"],
    popularity = json["popularity"],
    title = json["title"],
    backPoster = json["backdrop_path"],
    poster = json["poster_path"],
    overview = json["overview"],
    rating = json["vote_average"];
}

