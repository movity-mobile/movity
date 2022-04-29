import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movity_app/bloc/genre.bloc.dart';
import 'package:movity_app/bloc/movies.bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movity_app/widgets/drawer.widget.dart';
import 'package:movity_app/widgets/kText.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc=context.read<MovieBloc>();
    TextEditingController _textEditingController = TextEditingController();
    _textEditingController.text=movieBloc.currentQuery;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies")
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                width: 1, color: Colors.deepOrange
                            ))),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<MovieBloc>().add(SearchMoviesEvent(_textEditingController.text));
                  },
                  icon: Icon(Icons.search,color: Theme.of(context).primaryColor,),
                )
              ],
            ),
          ),
          Expanded(child: BlocBuilder<MovieBloc, MoviesState>(
            builder: (context, state) {
              return Builder(
                builder: (context) {
    if (state is SearchMoviesLoadingState) {
    return const Center(
    child: CircularProgressIndicator()
    );
    }
    else if (state is SearchGenreErrorState) {
    return Center(
    child: Column(children: [
    Text("$state.errorMessage"),
    ElevatedButton(onPressed: (){
    movieBloc.add(movieBloc.lastEvent);
    }, child: Text("Retry"))
    ]),
    );
    } else if (state is SearchMoviesSuccessState ) {
    return LazyLoadScrollView(
    onEndOfPage:(){
    movieBloc.add(NextMoviesPageEvent());
    },
    child:Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20
    ),
    child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    childAspectRatio: .66
    ),
    itemCount: state.movies.length,
    shrinkWrap: true,
    primary: false,
    itemBuilder: (context,index){
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: Get.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
              ),
            ),
            child: ClipRRect(

              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)
              ),
              child:Image.network("https://image.tmdb.org/t/p/original/${state.movies[index].backdropPath}"),

            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: '${state.movies[index].title}',
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  KText(
                    text: '${state.movies[index].releaseDate}',
                    color: Colors.blue,
                    fontSize: 13,
                  ),
                  SizedBox(height: 2),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 15,
                    // updateOnDrag: true,
                    tapOnlyMode: true,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 2),
                  KText(
                    text: '${state.movies[index].overview}',
                    maxLines: 3,
                    color: Colors.blue.withOpacity(.70),
                    fontSize: 11,
                  ),
                ],

              ),
          )
        ],
      ),

    );

    },
    ),
    ),
    );
                  } else
                  return Container();
                  },
              );
            },
          ))
        ],
      ),
    );
  }
}

