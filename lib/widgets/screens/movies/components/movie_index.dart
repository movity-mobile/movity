import 'package:flutter/material.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/data/data.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/widgets/genres_format.dart';
import 'package:movity_app/widgets/screens/details/detail_screen.dart';
import 'package:movity_app/widgets/star_rating.dart';



class MovieIndex extends StatefulWidget {
  final int index;
  final ScrollController movieScrollController;
  final double movieItemWidth;
  final List<Movie> list_movies;

  MovieIndex(this.index, this.movieScrollController, this.movieItemWidth, this.list_movies);

  @override
  _MovieIndexState createState() => _MovieIndexState();
}

class _MovieIndexState extends State<MovieIndex> {
  double maxMovieTranslate = 65;
  var movieData = MovieData();
  double _movieTranslate(double offset, double activeOffset) {
    double translate;
    if (widget.movieScrollController.offset + widget.movieItemWidth <=
        activeOffset) {
      translate = maxMovieTranslate;
    } else if (widget.movieScrollController.offset <= activeOffset) {
      translate = maxMovieTranslate -
          ((widget.movieScrollController.offset -
              (activeOffset - widget.movieItemWidth)) /
              widget.movieItemWidth *
              maxMovieTranslate);
    } else if (widget.movieScrollController.offset <
        activeOffset + widget.movieItemWidth) {
      translate = ((widget.movieScrollController.offset -
          (activeOffset - widget.movieItemWidth)) /
          widget.movieItemWidth *
          maxMovieTranslate) -
          maxMovieTranslate;
    } else {
      translate = maxMovieTranslate;
    }
    return translate;
  }

  double _movieDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (widget.movieScrollController.offset + widget.movieItemWidth <=
        activeOffset) {
      opacity = 0;
    } else if (widget.movieScrollController.offset <= activeOffset) {
      opacity = ((widget.movieScrollController.offset -
          (activeOffset - widget.movieItemWidth)) /
          widget.movieItemWidth *
          100);
    } else if (widget.movieScrollController.offset <
        activeOffset + widget.movieItemWidth) {
      opacity = 100 -
          (((widget.movieScrollController.offset -
              (activeOffset - widget.movieItemWidth)) /
              widget.movieItemWidth *
              100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: AnimatedBuilder(
              animation: widget.movieScrollController,
              builder: (context, child) {
                double activeOffset = widget.index * widget.movieItemWidth;
                double opacity = _movieDescriptionOpacity(
                    widget.movieScrollController.offset, activeOffset);

                return Opacity(
                  opacity: opacity / 100,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width :size.width/2,
                          child: Text(
                            '${widget.list_movies[widget.index].title}',
                            style: TextStyle(
                                color: white,
                                fontSize: size.width / 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Center(
            child:GenresFormat(
                widget.list_movies[widget.index].genreIds,
                white
            ),
          ),
          StarRating(widget.list_movies[widget.index].voteAverage),
          SizedBox(
            height: size.height * .01,
          ),
          Container(
            width: size.width * .25,
            height: 1,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder:(context, a1, a2) => DetailScreen(
                      movie: movieData.movieList[widget.index],
                      size: size,
                    )
                )),
            child: Container(
              width: size.width * .25,
              height: size.height * .05,
              decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(child: Text('BUY TICKET', style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
              ),)),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          GestureDetector(
            onTap:null,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              child: Image(
                image: NetworkImage('https://image.tmdb.org/t/p/original/${widget.list_movies[widget.index].posterPath}'),
                width: size.width * 0.5,
                height: size.height * 0.35,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),

        ],
      ),
    );
  }
}
