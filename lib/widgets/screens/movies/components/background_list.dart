import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movity_app/bloc/random_movies_bloc.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/model/random_movies_response.model.dart';
import 'package:movity_app/widgets/graphics.widget.dart';
import 'package:movity_app/widgets/graphics404.widget.dart';

class BackgroundListView extends StatefulWidget {
  final ScrollController backgroundScrollController;

  BackgroundListView(this.backgroundScrollController, List<Movie> list);

  @override
  _BackgroundListViewState createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {
  List<Movie>? movieData = [];
  List<Movie>? list_movies=[];
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
        children: <Widget>[
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
    List<Movie>? movies = data?.movies;
    list_movies?.addAll(movies!);
    Size size = MediaQuery.of(context).size;

    if (list_movies!.length == 0) {
      return Container(
        child: Graphics404(),
      );
    } else
      return ListView.builder(
        controller: widget.backgroundScrollController,
        padding: EdgeInsets.zero,
        reverse: false,
        itemCount: list_movies!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  left: -size.width / 3,
                  right: -size.width / 3,
                  child: Image(
                    height: size.height,
                    width: size.width,
                    image: NetworkImage('https://image.tmdb.org/t/p/original/${list_movies![index].backdropPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: black.withOpacity(.4),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          // black.withOpacity(.9),
                          black.withOpacity(.3),
                          black.withOpacity(.95)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 0.9]),
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}
