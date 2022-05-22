import 'package:movity_app/model/actors_response.model.dart';
import 'package:movity_app/repository/home.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class ActorsListBloc{
  final HomeMovieRepository _repository = HomeMovieRepository();
  final BehaviorSubject<ActorsResponse> _subject =
  BehaviorSubject<ActorsResponse>();


  getCredits(int? movieId) async {
    ActorsResponse response = await _repository.getCredits(movieId);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<ActorsResponse> get subject => _subject;
}

final actorBloc = ActorsListBloc();
