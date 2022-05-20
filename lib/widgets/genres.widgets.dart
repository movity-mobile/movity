import 'package:flutter/material.dart';
import 'package:movity_app/bloc/get_genres.bloc.dart';
import 'package:movity_app/model/genre_home.model.dart';
import 'package:movity_app/model/genre_response.model.dart';

import '../model/genre.model.dart';
import 'genres_list.widget.dart';
class GenresScreen extends StatefulWidget {
  const GenresScreen({Key? key}) : super(key: key);

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  @override
  void initState() {
    super.initState();
    genresBloc..getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
        stream: genresBloc.subject.stream,
        builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
          if (snapshot.hasData) {
            //&& snapshot.data?.error.length > 0

            return _buildGenreWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data?.error);
          } else {
            return _buildLoadingWidget();
          }
        }
    );
  }

  Widget _buildErrorWidget(String ? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error occured heere: $error")
        ],
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
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGenreWidget(GenreResponse ? data) {
    List <MovieGenre>? genres = data?.genres;
    if (genres!.length == 0) {
      return Container(
        child: Text("No genre found"),
      );
    }
    else
      return GenreList(null,genres);
  }
}
