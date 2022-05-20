import 'package:flutter/material.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/widgets/screens/movies/components/movie_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
class MovieListView extends StatefulWidget {

  final ScrollController movieScrollController;
  final double movieItemWidth;
  final List<Movie> list_movies;

  MovieListView(this.movieScrollController,this.movieItemWidth, this.list_movies);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {


  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      //curve: Curves.easeOutCubic,
      builder: (_,value, child) {
        return Transform.translate(
          offset: Offset(4, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ScrollSnapList(
            listController: widget.movieScrollController,
            onItemFocus: (item) {
            },
            itemSize: widget.movieItemWidth,
            padding: EdgeInsets.zero,
            itemCount:5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieIndex(index, widget.movieScrollController, widget.movieItemWidth, widget.list_movies);
            },
          ),
        ),
      ),
    );
  }
}
