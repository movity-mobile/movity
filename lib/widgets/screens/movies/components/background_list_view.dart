import 'package:flutter/material.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/model/movie.model.dart';

class BackgroundListView extends StatefulWidget {

  final ScrollController backgroundScrollController;
  final List<Movie> list_movies;
  BackgroundListView(this.backgroundScrollController, this.list_movies);

  @override
  _BackgroundListViewState createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      controller: widget.backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: false,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -size.width / 4,
                right: -size.width / 4,
                child: Image(
                  height: size.height,
                  image: NetworkImage('https://image.tmdb.org/t/p/original/${widget.list_movies[index].backdropPath}'),
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
                      stops: [ 0.5, 0.9]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
