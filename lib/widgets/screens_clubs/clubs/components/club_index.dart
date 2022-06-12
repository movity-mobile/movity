import 'package:flutter/material.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/data/clubs.dart';
import 'package:movity_app/widgets/star_rating.dart';



class ClubIndex extends StatefulWidget {
  final int index;
  final ScrollController movieScrollController;
  final double movieItemWidth;

  ClubIndex(this.index, this.movieScrollController, this.movieItemWidth);

  @override
  _ClubIndexState createState() => _ClubIndexState();
}

class _ClubIndexState extends State<ClubIndex> {
  var clubData = ClubData();
  double maxMovieTranslate = 65;

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
      margin: EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.movieScrollController,
            builder: (ctx, child) {
              double activeOffset = widget.index * widget.movieItemWidth;

              double translate = _movieTranslate(
                  widget.movieScrollController.offset, activeOffset);
              double opacity = _movieDescriptionOpacity(
                  widget.movieScrollController.offset, activeOffset);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                          '${clubData.clubsList[widget.index].name}',
                          style: TextStyle(
                              color: white,
                              fontSize: size.width / 16,
                              fontWeight: FontWeight.w600),
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
          SizedBox(
            height: size.height * .008,
          ),
          Container(
            height: size.height * .15,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: size.width / 2.5,
                image: NetworkImage('https://res.cloudinary.com/nesrine/image/upload/${clubData.clubsList[widget.index].imageLogo}'),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .005,
          ),
          StarRating(clubData.clubsList[widget.index].rating),
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
          Center(
            child: Text(
              '${clubData.clubsList[widget.index].description}',
              style: TextStyle(
                  color: white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
        ],
      ),
    );
  }
}
