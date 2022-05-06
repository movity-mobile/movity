import 'package:movity_app/model/movie_response.model.dart';
import 'package:movity_app/repository/home.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingListBloc{
  final HomeMovieRepository _repository = HomeMovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
  BehaviorSubject<MovieResponse>();


  getMovies() async {
    MovieResponse response = await _repository.getPlayingMovies();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final nowPlayingoviesBloc = NowPlayingListBloc();
