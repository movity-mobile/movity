import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movity_app/bloc/genre.bloc.dart';

import '../widgets/drawar.widget.dart';

class Filter extends StatelessWidget {
  List genres = ["Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Music","Mystery","Romance","Science Fiction"
      "TV Movie","Thriller", "War","Western"];

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 12,
          child:
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(7.0),
                child: Container(
                    alignment: Alignment.center,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Text("${genres[index]}")),
              );
            },
          )
    );
  }
}