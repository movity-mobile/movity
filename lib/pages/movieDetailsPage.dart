import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movity_app/bloc/movie.details.bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movity_app/widgets/kText.dart';
import 'package:get/get.dart';
class MovieDetailsPage extends StatelessWidget {
  final String movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsBloc movieDetailsBloc  = context.read<MovieDetailsBloc>();
    movieDetailsBloc.add(GetMovieDetailsEvent(movie: this.movie));
    return Scaffold(
      appBar: AppBar(title: const Text('Movie\'s Details')),
      body: Column(
        children: [
          BlocBuilder<MovieDetailsBloc , MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsLoadingState) {
                return Center(
                  child: const CircularProgressIndicator(),
                );
              } else if (state is MovieDetailsErrorState) {
                return Center(
                  child: Column(children: [
                    Text("${state.errorMessage}"),
                    ElevatedButton(
                        onPressed: () {
                          movieDetailsBloc.add(movieDetailsBloc.lastEvent);
                        },
                        child: Text("Retry"))
                  ]),
                );
              }
              if (state is MovieDetailsSuccessState) {

                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return

                          ListTile(
                            subtitle: Text("${state.movieDetails[index]['original_title']}",
                              style: TextStyle(color: Theme.of(context).primaryColor,
                              ),),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${state.movieDetails[index]['genres'][0]['name']}"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${state.movieDetails[index]['vote_count']}",
                                      maxLines: 1,style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                          );
                      },
                      separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                      itemCount: state.movieDetails.length),
                );
                  /*Expanded(
                  child: Text("TEST")
                  /*SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Get.defaultDialog(
                                title: '${item.title}',
                                content: Image.network(
                                  'https://image.tmdb.org/t/p/original/${item.backdropPath}',
                                  fit: BoxFit.cover,
                                  height: 500,
                                  width: Get.width,
                                ),
                              ),
                              child: Container(
                                height: 200,
                                width: Get.width,
                                color: Colors.blue,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${item.backdropPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: KText(
                                text: 'OverView',
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  KText(
                                    text: '${item.title}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                  SizedBox(width: 10),
                                  KText(
                                    text: '${item.releaseDate}',
                                    fontSize: 20,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                itemSize: 20,
                                // updateOnDrag: true,
                                tapOnlyMode: true,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 5),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 60,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                primary: false,
                                itemCount: 5, //item.length
                                padding: EdgeInsets.only(left: 12),
                                itemBuilder: (context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      // width: 140,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: KText(
                                            text:
                                            '${item.popularity}'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: KText(
                                        text: 'Story Line',
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  KText(
                                    text: '${item.overview}',
                                    fontSize: 14,
                                    maxLines: 100,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),*/

                );*/

              } else
                return Container();
            },
          )
        ],
      ),
    );
  }
}
