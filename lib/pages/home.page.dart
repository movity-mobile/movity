import 'package:flutter/material.dart';
import 'package:movity_app/UI/theme.ui.dart' as Style;
import 'package:movity_app/widgets/now_playing.widget.dart';
import '../widgets/drawar.widget.dart';
import '../widgets/genres.widgets.dart';
import '../widgets/person.widget.dart';
import '../widgets/top_movies.widgets.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Style.Colors.mainColor,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        title: const Text("Movity App"),
      ),
      body: ListView(
        children : <Widget>[
          NowPlaying(),
          const GenresScreen(),
          PersonList(),
          TopMovies(),

          /////put here something



      ]
      ),
    );
  }
}