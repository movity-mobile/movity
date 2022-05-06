import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movity_app/model/movie.list.model.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/repository/genre.repository.dart';
import 'package:movity_app/repository/movie.repository.dart';

import '../repository/movie.repository.dart';

abstract class MoviesEvent {}

class SearchMoviesEvent extends MoviesEvent {
  final String query;
  final String genre;

  SearchMoviesEvent(this.query, this.genre);
}

class NextMoviesPageEvent extends MoviesEvent {
}

enum StateStatus { none, success, error, loading }

abstract class MoviesState {}

class SearchMoviesNoneState extends MoviesState {
}

class SearchMoviesSuccessState extends MoviesState {
  List<Movie> movies = [];

  SearchMoviesSuccessState({required this.movies});
}

class SearchMoviesErrorState extends MoviesState {
  late String errorMessage;

  SearchMoviesErrorState({required this.errorMessage});
}

class SearchMoviesLoadingState extends MoviesState {}

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository = MoviesRepository();
  final GenresRepository genresRepository = GenresRepository();
  late MoviesEvent lastEvent;
  int currentPage = 1;
  int totalPages = 0;
  String currentQuery = "";
  bool isGenre = false;
  List<Movie> movies = [];

  MovieBloc() : super(SearchMoviesNoneState()) {
    on((SearchMoviesEvent event, emit) async {
      try {
        currentPage = 1;
        currentQuery = event.query != "" ? event.query : event.genre;
        isGenre = event.query == "" ? true: false;
        movies = [];
        lastEvent = event;
        emit(SearchMoviesLoadingState());
        SearchMovieResponse response = event.query != ""
            ? await moviesRepository.searchMovies(currentQuery, currentPage)
            : await genresRepository.searchMoviesByGenre(
                currentQuery, currentPage);
        totalPages = (response.totalResults).floor();
        movies.addAll(response.results);
        if (response.totalResults != 0) ++totalPages;
        emit(SearchMoviesSuccessState(movies: movies));
      } catch (ex) {
        emit(SearchMoviesErrorState(errorMessage: ex.toString()));
      }
    });
    on((NextMoviesPageEvent event, emit) async {
      try {
        if (currentPage >= totalPages - 1) return;
        lastEvent = event;
        SearchMovieResponse response =
        isGenre
            ? await genresRepository.searchMoviesByGenre(
            currentQuery, currentPage)
            : await moviesRepository.searchMovies(currentQuery, currentPage);
        totalPages = (response.totalResults).floor();
        movies.addAll(response.results);
        if (response.totalResults != 0) ++totalPages;
        emit(SearchMoviesSuccessState(movies: movies));
      } catch (ex) {
        --currentPage;
        emit(SearchMoviesErrorState(errorMessage: ex.toString()));
      }
    });
  }
}
