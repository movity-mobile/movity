import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/widgets/genres_format.dart';
import 'package:movity_app/widgets/star_rating.dart';
import 'package:rubber/rubber.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class DetailRubberSheet extends StatefulWidget {
  final Movie movie;
  final ScrollController rubberSheetScrollController;
  final RubberAnimationController rubberSheetAnimationController;

  DetailRubberSheet(
    this.movie,
    this.rubberSheetScrollController,
    this.rubberSheetAnimationController,
  );

  @override
  _DetailRubberSheetState createState() => _DetailRubberSheetState();
}

class _DetailRubberSheetState extends State<DetailRubberSheet> {
  /*Widget _cast(List castList) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 120.0,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: castList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: appPadding),
              child: Container(
                width: size.width / 6,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: widget.movie.castList[index].photo.image,
                        width: size.width / 6,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      widget.movie.castList[index].name,
                      style: TextStyle(
                        color: black.withOpacity(0.6),
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }*/
  int randomNumber = new Random().nextInt(7);
  int randomClub = new Random().nextInt(4);
  final days = ["Monday", "Tuesday", "Tuesday", "Thursday","Friday","Saturday","Sunday"];
  final clubs=[
                {"name":"Rotaract","img":"/v1654195006/tvdtc6q9t6naxzt2j82j.jpg"},
                {"name":"Dreams Hopes","img":"/v1654195006/lmyctue31irkdfzs5z6n.jpg"},
                {"name":"Ambition Jeunes","img":"/v1654195005/lyyyzof7hmimvii8qpon.jpg"},
                {"name":"X Event","img":"/v1654195006/bwwqdyxrvvdgqglj2dvy.png"}
              ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: size.height / 2, end: 0),
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(0, 4),
          child: child,
        );
      },
      child: RubberBottomSheet(
        scrollController: widget.rubberSheetScrollController,
        animationController: widget.rubberSheetAnimationController,
        lowerLayer: Container(
          color: Colors.transparent,
        ),
        upperLayer: Container(
          child: Column(
            children: [
              /*Container(
                child: Center(
                  child: Image(
                    image: widget.movie.imageLogo.image,
                    width: size.width / 2,
                  ),
                ),
              ),*/
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(appPadding),
                    controller: widget.rubberSheetScrollController,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.calendar_today,
                            color: secondary
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "${DateFormat('EEEE').format(DateTime.now())==days[randomNumber]?"Today":"This ${days[randomNumber]}"}",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "${widget.movie.title}",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      GenresFormat(widget.movie.genreIds, Colors.black),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.movie.voteAverage}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          StarRating(widget.movie.voteAverage),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      /*Text(
                        'Director : ' + widget.movie.director,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),*/
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Club',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //Function to show club
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                            image: NetworkImage('https://res.cloudinary.com/nesrine/image/upload${clubs[randomClub]['img']}'),
                            height: 100,
                          ),
                        ),
                        Text(
                          '${clubs[randomClub]['name']}',
                          style: TextStyle(
                            color: black.withOpacity(0.6),
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        )
                      ,
                      Text(
                        'Story Line',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        '${widget.movie.overview}',
                        style: TextStyle(
                          fontSize: 15,
                          color: black.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
