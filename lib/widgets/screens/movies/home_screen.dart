import 'package:flutter/material.dart';
import 'package:movity_app/bloc/random_movies_bloc.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/model/random_movies_response.model.dart';

import 'package:movity_app/widgets/graphics404.widget.dart';
import 'package:movity_app/widgets/screens/movies/components/background_list_view.dart';
import 'package:movity_app/widgets/screens/movies/components/movie_list_view.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? movieData = [];
  List<Movie>? list_movies=[];
  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    randomMoviesBloc..getMovies();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RandomMovieResponse>(
        stream: randomMoviesBloc.subject.stream,
        builder: (context, AsyncSnapshot<RandomMovieResponse> snapshot) {
          if (snapshot.hasData) {
            //&& snapshot.data?.error.length > 0

            return _buildMoviesWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data?.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildErrorWidget(String? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Error occured here: $error")],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child:
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            )
            ,
          )
        ],
      ),
    );
  }

  Widget _buildMoviesWidget(RandomMovieResponse? data) {

    Size size = MediaQuery.of(context).size;
    // connecting Background list and Movie list
    movieScrollController.addListener(() {
      backgroundScrollController.jumpTo(
          movieScrollController.offset * (size.width / movieItemWidth)
      );
    });
    List<Movie>? movies = data?.movies;
    list_movies?.addAll(movies!);
    if (list_movies!.length == 0) {
      return Container(
        child: Graphics404(),
      );
    } else {
      return Scaffold(
        backgroundColor: black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //Background of home screen
            BackgroundListView(backgroundScrollController,list_movies!),

            //Movie detail List view
            MovieListView(movieScrollController, movieItemWidth,list_movies!),
          ],
        ),
      );
    }
  }
}
