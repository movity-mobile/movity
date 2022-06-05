import 'package:flutter/material.dart';
import 'package:movity_app/constants/constants.dart';


class StarsRating extends StatefulWidget {

  final String? rating;

  StarsRating(this.rating);

  @override
  _StarsRatingState createState() => _StarsRatingState();
}

class _StarsRatingState extends State<StarsRating> {
  @override
  Widget build(BuildContext context) {

    Widget star(bool fill){
      return Container(
        child: Icon(
          Icons.star,
          size: 18.0,
          color: fill ? Colors.amber : grey,
        ),
      );
    }

    return Row(
      children: List.generate(5, (index) {
        if(index < (double.parse(widget.rating!) / 2).round()){
          return star(true);
        }
        else
          {
            return star(false);
          }
      }),
    );
  }
}
