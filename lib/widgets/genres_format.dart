import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GenresFormat extends StatefulWidget {

  final List<int>? genres;
  Color color;

  GenresFormat(this.genres, this.color);

  @override
  _GenresFormatState createState() => _GenresFormatState();
}

class _GenresFormatState extends State<GenresFormat> {
  var list_genres = ["Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Music","Mystery","Romance","Science Fiction"
      "TV Movie","Thriller", "War","Western"];
  List index_genres = [28,12,16,35,80,99,18,10751,14,36,27,10402,9648,10749,878,10770,53,10752,37];

  List<String> list_name_genres = [];
  @override
  Widget build(BuildContext context) {
    Widget _dot = Container(
      width: 6.0,
      height: 6.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(50.0)),
    );

        if(list_name_genres.length==0){
        for(int i=0;i<widget.genres!.length;i++) {
          list_name_genres.add(
              list_genres[index_genres.indexOf(widget.genres![i])]);
        }
    }
    print(list_name_genres);
      print(widget.genres);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(list_name_genres.length, (index) {
        if (index < list_name_genres.length - 1) {
          return Row(
            children: [
              Text(
                list_name_genres[index],
                style: TextStyle(color: widget.color, fontSize: 9),
              ),
              _dot,
            ],
          );
        }
        else {
          return Text(list_name_genres[index],style: TextStyle(color: widget.color,fontSize: 9),);
        }
      }),
    );
  }
}
