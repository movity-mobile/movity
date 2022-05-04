import 'package:bloc/bloc.dart';
import 'package:movity_app/repository/movie.repository.dart';

abstract class MovieDetailsEvent{}
abstract class MovieDetailsState{}
class GetMovieDetailsEvent extends MovieDetailsEvent{
  String movie;
  GetMovieDetailsEvent({required this.movie});
}
class MovieDetailsSuccessState extends MovieDetailsState {
  List<dynamic> movieDetails=[];
  MovieDetailsSuccessState({required this.movieDetails});
}
class MovieDetailsLoadingState extends MovieDetailsState {
}
class MovieDetailsErrorState extends MovieDetailsState {
  String errorMessage;
  MovieDetailsErrorState(this.errorMessage);
}
class MovieDetailsBloc extends Bloc<MovieDetailsEvent,MovieDetailsState>{
  MoviesRepository moviesRepository=MoviesRepository();
  late MovieDetailsEvent lastEvent;
  MovieDetailsBloc() : super(MovieDetailsSuccessState(movieDetails: [])){
    on((GetMovieDetailsEvent event, emit)async {
      emit(MovieDetailsLoadingState());
      lastEvent=event;
      try{
        List<dynamic> data=await moviesRepository.MoreDetailsMovie(event.movie);
        emit(MovieDetailsSuccessState(movieDetails: data));
      }
      catch(ex){
        emit(MovieDetailsErrorState(ex.toString()));
      }
    });
  }
}