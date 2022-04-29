import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movity_app/model/genre.list.model.dart';
import 'package:movity_app/model/movie.list.model.dart';
class GenresRepository {
  Future<SearchGenreList> searchGenres() async{
    //https://api.github.com/users/mohamedYoussfi/repos
    //Uri uri=Uri.https("api.github.com", "/search/users",{'q':"mohamed","page":0,"per_page":10});
    try{
      //
      Uri uri=Uri.parse("https://api.themoviedb.org/3/genre/movie/list?api_key=3fc73fc9f3cd7676a42b50bdf468abf3");
      Response response= await http.get(uri);
      print(response.body);
      if(response.statusCode==200){
      //  print(response.body);
        return SearchGenreList.fromJson(json.decode(response.body));
      } else {
        throw ("Error in getting movie's categories ${response.statusCode}");
      } }
    catch(ex){
      throw("$ex.toString()");
    }
  }

}