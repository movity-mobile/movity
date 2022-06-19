import 'package:flutter/material.dart';
import 'package:movity_app/constants/constants.dart';
import 'package:movity_app/widgets/screens_clubs/clubs/components/background_list_view.dart';
import 'package:movity_app/widgets/screens_clubs/clubs/components/club_list_view.dart';



class ClubScreen extends StatefulWidget {
  @override
  _ClubScreenState createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {

  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    // connecting Background list and Movie list
    movieScrollController.addListener(() {
      backgroundScrollController.jumpTo(
        movieScrollController.offset * (size.width / movieItemWidth)
      );
    });

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of home screen
          BackgroundListView(backgroundScrollController),

          //Club detail List view
          ClubListView(movieScrollController, movieItemWidth,),
        ],
      ),
    );
  }
}
