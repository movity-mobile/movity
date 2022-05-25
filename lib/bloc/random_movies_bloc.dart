import 'package:movity_app/model/random_movies_response.model.dart';
import 'package:movity_app/repository/movies_random.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class RandomMoviesListBloc{
  final RandomMovieRepository _repository = RandomMovieRepository();
  final BehaviorSubject<RandomMovieResponse> _subject =
  BehaviorSubject<RandomMovieResponse>();


  getMovies() async {
    RandomMovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<RandomMovieResponse> get subject => _subject;
}

final randomMoviesBloc = RandomMoviesListBloc();
