import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movity_app/bloc/movies.bloc.dart';
import 'package:movity_app/model/movie.model.dart';
import 'package:movity_app/pages/movieDetailsPage.dart';
import 'package:movity_app/widgets/discover_movies.widgets.dart';
import 'package:movity_app/widgets/filter.widget.dart';
import 'package:movity_app/widgets/graphics.widget.dart';
import 'package:movity_app/widgets/graphics404.widget.dart';
import 'package:movity_app/widgets/stars_rating.dart';
import 'package:movity_app/widgets/switch.widget.dart';
import '../widgets/drawar.widget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movity_app/widgets/kText.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:movity_app/UI/theme.ui.dart' as Style;

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();
    TextEditingController _textEditingController = TextEditingController();
    _textEditingController.text = movieBloc.currentQuery;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Search"),
        actions: const [MySwitch()],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color:Style.Colors.mainColor ),
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            border: OutlineInputBorder(
                              
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color:Style.Colors.mainColor))),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<MovieBloc>().add(
                            SearchMoviesEvent(_textEditingController.text, ""));
                      },
                      icon: const  Icon(
                        Icons.search,
                        color: Style.Colors.secondColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Filter(),
              ],
            ),
          ),
          Expanded(child: BlocBuilder<MovieBloc, MoviesState>(
            builder: (context, state) {
              return Builder(
                builder: (context) {
                  if (state is SearchMoviesLoadingState) {
                    return const Center(child: Graphics());
                  } else if (state is SearchMoviesErrorState) {
                    return Center(
                      child: Column(children: [
                        Text("$state.errorMessage"),
                        ElevatedButton(
                            onPressed: () {
                              movieBloc.add(movieBloc.lastEvent);
                            },
                            child: const Text("Retry"))
                      ]),
                    );
                  } else if (state is SearchMoviesSuccessState) {
                    return state.movies.isNotEmpty?
                    LazyLoadScrollView(
                      onEndOfPage: () {
                        movieBloc.add(NextMoviesPageEvent());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: GridView.builder(
                          gridDelegate:
                             const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: .66),
                          itemCount: state.movies.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            Movie movie =state.movies[index];
                            
                            return GestureDetector(
                               onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsPage(movie: movie),
                                    ),
                                  );
                                },
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Style.Colors.secondColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 130,
                                    width: Get.width,
                                    decoration: const BoxDecoration(
                                      color: Style.Colors.secondColor,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      child: 
                                      CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original/${state.movies[index].posterPath}',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .height,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/img_not_found.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    
                                    ),
                                  ),
                                  Padding(
                                    padding:const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        KText(
                                          text: '${state.movies[index].title}',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        KText(
                                          text:
                                              '${state.movies[index].releaseDate}',
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                        const SizedBox(height: 2),
                                        StarsRating(state.movies[index].voteAverage),
                                       
                                        const SizedBox(height: 2),
                                        KText(
                                          text:
                                              '${state.movies[index].overview}',
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
                      ),
                    ):const Graphics404();
                  } else {
                    return DiscoverMovies();
                  }
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
