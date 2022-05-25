import 'package:flutter/material.dart';
import 'package:movity_app/model/movie.model.dart';

import '../../../constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key? key,
    required this.originalTitle,
  }) : super(key: key);

  final String originalTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${originalTitle}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                 /*
                 Row(
                  children: <Widget>[
                    Text(
                      '${runtime} min',
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding),
                 
                  ],
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
