import 'package:flutter/material.dart';
import 'package:movity_app/bloc/get_movies_byGenre.bloc.dart';
import 'package:movity_app/model/genre_home.model.dart';
import 'package:movity_app/UI/theme.ui.dart'as Style;
import 'package:movity_app/widgets/genre_movies.widget.dart';
class GenreList extends StatefulWidget {
  final List<MovieGenre> genres;
  GenreList( key, @required this.genres):
      super(key: key);


  @override
  State<GenreList> createState() => _GenreListState(genres);
}

class _GenreListState extends State<GenreList> with SingleTickerProviderStateMixin{
  final List<MovieGenre> genres;
  _GenreListState(this.genres);
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
    _tabController.addListener(() {
      if(_tabController.indexIsChanging) {
        moviesByGenreBloc..drainStream();
      }
    });
  }
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 307.0,
          child: DefaultTabController(
            length: genres.length,
            child: Scaffold(
              backgroundColor: Style.Colors.mainColor,
              appBar: PreferredSize(
                child: AppBar(
                  backgroundColor: Style.Colors.mainColor,
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Style.Colors.secondColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3.0,
                    unselectedLabelColor: Style.Colors.titleColor,
                    labelColor: Colors.white,
                    isScrollable: true,
                    tabs: genres.map((MovieGenre genre) {
                      return Container(
                          padding:  EdgeInsets.only(bottom: 15.0, top: 10.0),
                          child: Text(genre.name.toUpperCase(),style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                          ),),

                      );
                    }).toList()
                  ),
                ),
                preferredSize: Size.fromHeight(50.0),
              ),
              body: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: genres.map((MovieGenre genre) {
                  return GenreMovies(null,genre.id);

                }).toList(),
              ),
            ) ,
          ),
    );
  }
}
