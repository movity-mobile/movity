import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movity_app/bloc/genre.bloc.dart';
import 'package:movity_app/bloc/movies.bloc.dart';

import '../widgets/drawar.widget.dart';

class Filter extends StatelessWidget {
  List genres = ["Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Music","Mystery","Romance","Science Fiction"
      "TV Movie","Thriller", "War","Western"];
  List index = ["28","12","16","35","80","99","18","10751","14","36","27","10402","9648","10749","878","10770","53","10752","37"];
  List<Widget> chips=[];
  @override
  Widget build(BuildContext context) {

    Widget _buildChips() {


      for (int i = 0; i < genres.length; i++) {
        ChoiceChip choiceChip = ChoiceChip(
          selected: true,
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            genres[i],
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText2!
                .copyWith(color: Colors.white, fontSize: 14),
          ),
          selectedColor: Theme.of(context).primaryColor,
          elevation: 1,
          padding: EdgeInsets.symmetric(horizontal: 10),
          pressElevation: 5,
          backgroundColor: Colors.grey[400],
          onSelected: (bool selected) {
            context.read<MovieBloc>().add(SearchMoviesEvent("",index[i]));
          },
        );
        chips.add(choiceChip);
      }
      return Wrap(
        direction: Axis.horizontal,
        runSpacing: 12,
        children: chips,
        spacing: 8,
      );
    }
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: _buildChips()
    );
  }
}
