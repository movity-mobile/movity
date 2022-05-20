import 'package:flutter/material.dart';
import 'package:movity_app/widgets/screens/movies/home_screen.dart';
import 'package:movity_app/widgets/switch.widget.dart';

import '../widgets/drawar.widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // connecting Background list and Movie list
    movieScrollController.addListener(() {
      backgroundScrollController
          .jumpTo(movieScrollController.offset * (size.width / movieItemWidth));
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'Movies',
        ),
        actions: [MySwitch()],
      ),
      body: HomeScreen()/*Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of movies screen
          //BackgroundListView(backgroundScrollController,),

          //Movie detail List view
          MovieListView(
            movieScrollController,
            movieItemWidth,
          ),

          //Appbar
          CustomAppBar(),
        ],
      ),*/
    );
  }
}
