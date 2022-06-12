import 'package:flutter/material.dart';
import 'package:movity_app/widgets/screens_clubs/clubs/clubs_screen.dart';
import 'package:movity_app/widgets/switch.widget.dart';

import '../widgets/drawar.widget.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({Key? key}) : super(key: key);

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
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
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            'Clubs',
          ),
        ),
        body: ClubScreen()
    );
  }
}
