import 'package:bloc/bloc.dart';
import 'package:movity_app/model/genre.list.model.dart';
import 'package:movity_app/model/genre.model.dart';
import 'package:movity_app/repository/genre.repository.dart';
import 'package:movity_app/repository/movie.repository.dart';

abstract class GenresEvent{
}
class SearchGenreEvent extends GenresEvent{
  SearchGenreEvent();
}

class GetGenderMoviesEvent extends GenresEvent{
  GetGenderMoviesEvent();
}
class SearchGenreSuccessState extends GenreState {
  List<dynamic> genres=[];
  SearchGenreSuccessState(
      {required this.genres});
}

enum StateStatus {success, error, loading, none}
abstract class GenreState{}

class SearchGenreErrorState extends GenreState {
  late String errorMessage;
  SearchGenreErrorState({required this.errorMessage});
}
class SearchGenresLoadingState extends GenreState {
}
class GenreBloc extends Bloc<GenresEvent,GenreState>{
  final MoviesRepository moviesRepository=MoviesRepository();
  final GenresRepository genresRepository = GenresRepository();
  late GenresEvent lastEvent;
  List<Genre> genres=[];
  GenreBloc() : super(SearchGenreSuccessState(genres: [])){
    on((SearchGenreEvent event, emit) async {
     try {
        lastEvent=event;
        emit(SearchGenresLoadingState());
        print("search...................");
        SearchGenreList response = (await genresRepository.searchMoviesByGenre("", 0)) as SearchGenreList;
        genres.addAll(response.genres);
        print(genres);
        emit(SearchGenreSuccessState(genres: genres));
      } catch(ex) {
        emit(SearchGenreErrorState(errorMessage: ex.toString()));
      }
      emit(SearchGenresLoadingState());
      lastEvent=event;
      try{
        List<dynamic> data=await moviesRepository.getGenreMovies();
        emit(SearchGenreSuccessState(genres: data));
      }
      catch(ex){
        emit(SearchGenreErrorState(errorMessage:ex.toString()));
      }
      });


  }

}

