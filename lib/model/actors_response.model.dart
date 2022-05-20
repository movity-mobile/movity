import 'package:movity_app/model/person.model.dart';

class ActorsResponse{
  final List<Person> persons;
  final String error;
 ActorsResponse(this.persons, this.error);

  ActorsResponse.fromJson(Map<String, dynamic> json)
      : persons = (json["cast"] as List).map((i)=> Person.fromJson(i)).toList(),
        error = "";
  ActorsResponse.withError(String errorValue)
      : persons = [], //List()
        error = errorValue;
}