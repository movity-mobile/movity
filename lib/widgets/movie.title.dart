import 'package:flutter/material.dart';
import 'package:movity_app/model/movie.model.dart';

import '../../../constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

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
                  '${movie.originalTitle}',
                  style:const TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26
                      ),
                  
                ),
               // const SizedBox(height: kDefaultPadding / 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
