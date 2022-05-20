import 'package:flutter/cupertino.dart';
import 'package:movity_app/model/movie_response.model.dart';
import 'package:movity_app/repository/home.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListByGenreBloc{
  final HomeMovieRepository _repository = HomeMovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
  BehaviorSubject<MovieResponse>();


  getMoviesByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);
  }
//////////heeeeeeeeeeeeeeereeeeeeeeeeee
void drainStream(){
    _subject.value = null as MovieResponse;
}
@mustCallSuper
void dispose() async {
await _subject.drain();
_subject.close();
}


  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesByGenreBloc = MoviesListByGenreBloc();
