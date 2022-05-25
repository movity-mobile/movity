import 'package:flutter/material.dart';
import 'package:movity_app/UI/theme.ui.dart'as Style;
import 'package:movity_app/bloc/movie_details_bloc.dart';
import 'package:movity_app/constants.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/model/movie_detail.dart';
import 'package:movity_app/widgets/actor.widget.dart';
import 'package:movity_app/widgets/backdrop_rating.dart';
import 'package:movity_app/widgets/genres.widget.dart';
import 'package:movity_app/widgets/movie.title.dart';
class MovieDetails extends StatefulWidget {
  
  int? movieId;
  Movie movie;
  MovieDetails(
    {key , 
    required this.movieId,
    required this.movie
    }
    ):
    super (key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState(movieId!,movie!);
}

class _MovieDetailsState extends State<MovieDetails> {
  final int movieId;
  final Movie movie;
  
  _MovieDetailsState(this.movieId,this.movie);
  @override
  void initState(){
    super.initState();
    movieDetailsBloc.getMovieDetails(this.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       /* const Padding(
          padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: kDefaultPadding,
              ),
          child: Text("CAST", style: TextStyle(
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.0
          ),),
        ),
        
        */
        const SizedBox(
          height: 5.0,
        ),
    StreamBuilder<MovieDetail>(
    stream: movieDetailsBloc.subject.stream,
    builder: (context, AsyncSnapshot<MovieDetail> snapshot){
    if(snapshot.hasData) {
    return _buildMovieDetailsWidget(snapshot.data);

    }else if (snapshot.hasError){
      return _buildErrorWidget("error");

    }else {
    return _buildLoadingWidget();
    }
    }
    )
      ],
    );
  }
  Widget _buildErrorWidget(String ? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error occured heere: $error")
        ],
      ),
    );
  }

  Widget _buildLoadingWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height : 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMovieDetailsWidget(MovieDetail ? data) {
    if (data==null) {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text("No Movie Details")
          ],
        ),
      );
    } else {
       Size size = MediaQuery.of(context).size;
       return 
       
       Scaffold(
        body: SingleChildScrollView(
        child: Expanded(
            child: ListView(
              shrinkWrap: true,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                SizedBox(
                  height: kDefaultPadding / 2,
                  child: BackdropAndRating(backdropPath: data.backdropPath.toString(),popularity: data.popularity.toString(),releaseDate: data.releaseDate.toString(), voteAverage: data.voteAverage.toString(), runtime: data.runtime.toString(), size: size,),
                ),
                MovieTitle(originalTitle: data.originalTitle.toString()),
                Genres(movie: movie),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2,
                    horizontal: kDefaultPadding,
                  ),
                  child: Text(
                    "Movie Summary",
                    style: TextStyle(
                  color: Style.Colors.titleColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0
                ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    movie.overview.toString(),
                    style: const TextStyle(
                     color:Style.Colors.mainColor
                    ),
                  ),
                ),
              
               actorList(null,movieId),
              
              
              ],
            ),
          ),
        ),
      
      );
    }
  }

}
