import 'package:movity_app/model/movie_detail.dart';
import 'package:movity_app/repository/movie.details.repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc{
  final MovieDetailsRepository _repository = MovieDetailsRepository();
  final BehaviorSubject<MovieDetail> _subject =
  BehaviorSubject<MovieDetail>();


  getMovieDetails(int? movieId) async {
    MovieDetail response = await _repository.getMovieDetail(movieId);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<MovieDetail> get subject => _subject;
}

final movieDetailsBloc = MovieDetailsBloc();
