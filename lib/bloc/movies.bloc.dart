import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movity_app/model/movie.list.model.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/repository/movie.repository.dart';

import '../repository/movie.repository.dart';
abstract class MoviesEvent{
}
class SearchMoviesEvent extends MoviesEvent{
  final String query;
  SearchMoviesEvent(this.query);
}
class NextMoviesPageEvent extends MoviesEvent{
}

enum StateStatus {success, error, loading, none}
abstract class MoviesState{}
class SearchMoviesSuccessState extends MoviesState {
  List<Movie> movies=[];

  SearchMoviesSuccessState(
      {required this.movies});
}
class SearchMoviesErrorState extends MoviesState {
  late String errorMessage;
  SearchMoviesErrorState({required this.errorMessage});
}
class SearchMoviesLoadingState extends MoviesState {
}
class MovieBloc extends Bloc<MoviesEvent,MoviesState>{
  final MoviesRepository moviesRepository=MoviesRepository();
  late MoviesEvent lastEvent;
  int currentPage=1;
  int totalPages=0;
  String currentQuery="";
  List<Movie> movies=[];
  MovieBloc() : super(SearchMoviesSuccessState(movies: [])){
    on((SearchMoviesEvent event, emit) async {
      try {
        currentPage=1;currentQuery=event.query;
        movies=[];
        lastEvent=event;
        emit(SearchMoviesLoadingState());
        SearchMovieResponse response = await moviesRepository.searchMovies(currentQuery,currentPage);
        totalPages=(response.totalResults).floor();
        movies.addAll(response.results);
        if(response.totalResults !=0) ++totalPages;
        emit(SearchMoviesSuccessState(movies: movies));
      } catch(ex) {
        emit(SearchMoviesErrorState(errorMessage: ex.toString()));
      }});
    on((NextMoviesPageEvent event, emit)async {
      try {
        if(currentPage>=totalPages-1) return;
        lastEvent=event;
        SearchMovieResponse response = await moviesRepository.searchMovies(currentQuery,++currentPage);
        totalPages=(response.totalResults).floor();
        movies.addAll(response.results);
        if(response.totalResults !=0) ++totalPages;
        emit(SearchMoviesSuccessState(movies: movies));
      } catch(ex) {
        --currentPage;
        emit(SearchMoviesErrorState(errorMessage: ex.toString()));
      }});
  }

}