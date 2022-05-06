import 'package:movity_app/model/person_response.model.dart';
import 'package:movity_app/repository/home.repositpory.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc{
  final HomeMovieRepository _repository = HomeMovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
  BehaviorSubject<PersonResponse>();


  getPersons() async {
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personsBloc = PersonsListBloc();
