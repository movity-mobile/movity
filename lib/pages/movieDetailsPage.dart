import 'package:flutter/material.dart';
import 'package:movity_app/constants.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/widgets/actor.widget.dart';
import 'package:movity_app/widgets/backdrop_rating.dart';
import 'package:movity_app/widgets/genres.widget.dart';
import 'package:movity_app/widgets/movie.title.dart';
// ignore: library_prefixes
import 'package:movity_app/UI/theme.ui.dart'as Style;
class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     
    
   Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           BackdropAndRating(size: size, movie: movie),
           const SizedBox(height: kDefaultPadding / 2),
           MovieTitle(movie: movie),
           Genres(movie: movie),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: kDefaultPadding,
              ),
              child: Text(
                "Movie Summary",
                style: TextStyle(
              color: Style.Colors.secondColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                movie.overview.toString(),
                style: const TextStyle(
                 color:Colors.white
                ),
              ),
            ),
           actorList(null,movie.id),
          ],
        ),
      ),
    );
  }
}
