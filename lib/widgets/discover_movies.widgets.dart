import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movity_app/UI/theme.ui.dart' as Style;
import 'package:movity_app/bloc/discover_movies_bloc.dart';
import 'package:movity_app/model/discover_movie_response.model.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/pages/movieDetailsPage.dart';
import 'package:movity_app/widgets/graphics.widget.dart';
import 'package:movity_app/widgets/graphics404.widget.dart';
import 'package:movity_app/widgets/kText.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:get/get.dart';

class DiscoverMovies extends StatefulWidget {
  const DiscoverMovies({Key? key}) : super(key: key);

  @override
  State<DiscoverMovies> createState() => _DiscoverMoviesState();
}

class _DiscoverMoviesState extends State<DiscoverMovies> {
  int page=1;
  // ignore: non_constant_identifier_names
  List<Movie>? list_movies=[];
  @override
  void initState() {
    super.initState();
    moviesBloc.discoverMovies(page);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DiscoverMovieResponse>(
        stream: moviesBloc.subject.stream,
        builder: (context, AsyncSnapshot<DiscoverMovieResponse> snapshot) {
          if (snapshot.hasData) {
            return _buildMoviesWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data?.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildErrorWidget(String? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Error occured here: $error")],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child:
                Graphics()
            ,
          )
        ],
      ),
    );
  }

  Widget _buildMoviesWidget(DiscoverMovieResponse? data) {
    List<Movie>? movies = data?.movies;
    list_movies?.addAll(movies!);
    if (list_movies!.isEmpty) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: const Graphics404(),
      );
    } else {
      return LazyLoadScrollView(
          onEndOfPage: () {
            page++;
            moviesBloc.discoverMovies(page);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: .66),
              itemCount: list_movies!.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                Movie movie =list_movies![index];
                return GestureDetector(
                    onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsPage(movie: movie),
                                          //MovieDetailScreen(movie: movie),
                                    ),
                                  );
                                },
                  child:Container(
                  decoration: BoxDecoration(
                      color: Style.Colors.secondColor,
                      borderRadius:  BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Style.Colors.secondColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(top: Radius.circular(20)),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${list_movies![index].backdropPath}',
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              width: MediaQuery.of(context).size.height,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/img_not_found.jpg'),
                                ),
                              ),
                            ),
                          ),
                          /*Image.network(


                    "https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}"
              ),*/
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: '${list_movies![index].title}',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            KText(
                              text: '${list_movies![index].releaseDate}',
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            const SizedBox(height: 2),
                            RatingBar.builder(
                              initialRating: double.parse(
                                  list_movies![index].voteAverage.toString()),
                              minRating: 1,
                              maxRating: 10,
                              itemSize: 15,
                              // updateOnDrag: true,
                              tapOnlyMode: true,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // ignore: avoid_print
                                print(rating);
                              },
                            ),
                            const SizedBox(height: 2),
                            KText(
                              text: '${list_movies![index].overview}',
                              maxLines: 3,
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                );
                
              },
            ),
          ));
    }
  }
}
