import 'package:flutter/material.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/widgets/genre_card.dart';

import '../../../constants.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    List genres = ["Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Music","Mystery","Romance","Science Fiction"
      "TV Movie","Thriller", "War","Western"];
    List index = [28,12,16,35,80,99,18,10751,14,36,27,10402,9648,10749,878,10770,53,10752,37];
    List<int>? genresIds=movie.genreIds;
    List<String> genresList=[];
    int k=0;
    for(int i=0;i<index.length;i++){
      for(int j=0;j<genresIds!.length;j++){
        if(index[i].compareTo(genresIds[j])==0){
          genresList.insert(k, genres[i]);
          k++;
        }
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genresList.length,
          itemBuilder: (context, index) => GenreCard(
            genre: genresList[index],
           // genre:'',
          ),
        ),
      ),
    );
  }
}
