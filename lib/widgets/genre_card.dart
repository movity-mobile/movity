import 'package:flutter/material.dart';

import '../constants.dart';

import 'package:movity_app/UI/theme.ui.dart'as Style;
class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key ? key, required this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: kDefaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        color: Style.Colors.secondColor,
        border: Border.all(color:Style.Colors.secondColor,),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
