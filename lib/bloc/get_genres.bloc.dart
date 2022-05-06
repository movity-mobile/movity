import 'package:movity_app/model/genre_response.model.dart';
import 'package:movity_app/repository/home.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class GenresListBloc{
  final HomeMovieRepository _repository = HomeMovieRepository();
  final BehaviorSubject<GenreResponse> _subject =
  BehaviorSubject<GenreResponse>();


  getGenres() async {
    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresBloc = GenresListBloc();
