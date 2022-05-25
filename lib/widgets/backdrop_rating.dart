import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movity_app/UI/theme.ui.dart' as Style;

import '../../../constants.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key? key,
    
    required this.size,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.popularity,
    required this.runtime
  }) : super(key: key);

  final Size size;
  final String runtime;
  final String backdropPath;
  final String voteAverage;
  final String releaseDate;
  final String popularity;
  //final String 
  @override
  Widget build(BuildContext context) {
    return  Container(
      // 40% of our total height
    //  height: size.height * 0.5,

      child: Expanded(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.9 -10,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  //https://image.tmdb.org/t/p/original/${movie.backdropPath}
                  image: NetworkImage('https://image.tmdb.org/t/p/original/${backdropPath}'),
                ),
              ),
            ),
            // Rating Box
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                // it will cover 90% of our total width
                width: size.width * 0.9,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset:const Offset(0, 5),
                      blurRadius: 50,
                      color: const Color(0xFF12153D).withOpacity(0.2),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //Vote Average
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Style.Colors.secondColor,
                            size: 24.0,
                          ),
                         const SizedBox(height: kDefaultPadding / 4),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "${voteAverage}/",
                                  style:const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                const TextSpan(text: "10"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      
                      // Release date
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         const Icon(
                            CupertinoIcons.calendar,
                            color: Style.Colors.secondColor,
                            size: 24.0,
                          ),
                                              //SvgPicture.asset("assets/icons/date.svg"),
                          const SizedBox(height: kDefaultPadding / 4),
                          Text("${releaseDate}",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                      // Popularity
                       Column(
      
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            CupertinoIcons.sparkles,
                            color: Style.Colors.secondColor,
                            size: 27.0,
                          ),
                          const SizedBox(height: kDefaultPadding / 4),
                          Text("${popularity}",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
      
                      /////////////runtime
                       Column(
      
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            CupertinoIcons.time,
                            color: Style.Colors.secondColor,
                            size: 27.0,
                          ),
                          const SizedBox(height: kDefaultPadding / 4),
                          Text("${runtime}",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                      
                    
                    ],
                  ),
                ),
              ),
            ),
            // Back Button
            SafeArea(child: BackButton()),
          ],
        ),
      ),
    );
  
  }
}
