import 'package:movity_app/model/discover_movie_response.model.dart';
import 'package:movity_app/repository/discover.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverMoviesListBloc{
  final DiscoverMovieRepository _repository = DiscoverMovieRepository();
  final BehaviorSubject<DiscoverMovieResponse> _subject =
  BehaviorSubject<DiscoverMovieResponse>();


  discoverMovies(page) async {
    DiscoverMovieResponse response = await _repository.discoverMovies(page);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<DiscoverMovieResponse> get subject => _subject;
}

final moviesBloc = DiscoverMoviesListBloc();
