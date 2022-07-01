import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movity_app/bloc/get_now_playing.bloc.dart';
import 'package:movity_app/model/home.movies.model.dart';
import 'package:movity_app/model/movie_response.model.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:movity_app/UI/theme.ui.dart' as Style;
import 'package:url_launcher/url_launcher.dart';

class NowPlaying extends StatefulWidget {

  @override
  _NowPlayingState createState() => _NowPlayingState();
  }

  class _NowPlayingState extends State<NowPlaying>{
  @override
  void initState(){

      super.initState();
      nowPlayingoviesBloc..getMovies();

    }

  @override
    Widget build (BuildContext context){
    return StreamBuilder<MovieResponse>(
        stream: nowPlayingoviesBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot){
              if(snapshot.hasData) {
                //&& snapshot.data?.error.length > 0

                return _buildNowPlayingWidget(snapshot.data);

              }else if (snapshot.hasError){
                return _buildErrorWidget(snapshot.data?.error);

              }else {
                return _buildLoadingWidget();
              }
        }
    );
  }

  Widget _buildErrorWidget(String ? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error occured heere: $error")
        ],
      ),
    );
  }

  Widget _buildLoadingWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            SizedBox(
              height : 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 4.0,
              ),
            )
        ],
      ),
    );
  }

  Widget _buildNowPlayingWidget( MovieResponse ? data ){
    List<HomeMovie>?  movies = data?.movies;
    if (movies!.length == 0){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: <Widget>[
            Text("No movies")
          ],
        ),
      );
    }else {
      return Container (
        height: 220,
        child: PageIndicatorContainer(
          align:  IndicatorAlign.bottom,
          indicatorSpace: 8.0,
          padding: EdgeInsets.all(5.0),
          indicatorColor: Style.Colors.titleColor,
          indicatorSelectorColor: Style.Colors.secondColor,
          shape: IndicatorShape.circle(size: 5.0),
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.take(5).length,
            itemBuilder: (context, index){
              return Stack(
                children: <Widget>[
                  Container(
                    width:  MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(image:NetworkImage("https://image.tmdb.org/t/p/original/" + movies[index].backPoster),
                      fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Style.Colors.mainColor.withOpacity(1.0),
                        Style.Colors.mainColor.withOpacity(0.0)
                      ],
                      begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.0,
                          0.9
                        ]
                      )
                    ),
                  ),
                  Container(
                    child:
                    GestureDetector(
                      onTap: () async {
                        String youtubeUrl =
                            '';
                        if (index == 0){
                          youtubeUrl =
                          'https://www.youtube.com/watch?v=Rt_UqUm38BI';
                        }else if (index == 1){
                          youtubeUrl = 'https://www.youtube.com/watch?v=V4tAtp-TyzQ';
                        }else if(index == 2){
                          youtubeUrl = 'https://www.youtube.com/watch?v=nfKO9rYDmE8&t=31s';
                        }else if(index == 3){
                          youtubeUrl = 'https://www.youtube.com/watch?v=UmDxTrJa3XA';
                        }else{
                          youtubeUrl = 'https://www.youtube.com/watch?v=oZ6iiRrz1SY&t=6s';
                        }
                        await launchUrl(Uri.parse(youtubeUrl));
                      },
                      child: Center(
                        child: Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Icon(FontAwesomeIcons.play, color: Style.Colors.secondColor, size: 40.0,)),
                      ),
                      ),
                    ),



/*
                  Container(
                    padding: EdgeInsets.only(top: 120),
                    child: GestureDetector(
                      onTap: () async {
                        final youtubeUrl =
                            'https://www.youtube.com/watch?v=Y9dr2zw-TXQ';
                        await launchUrl(Uri.parse(youtubeUrl));
                      },
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.play_circle_outline,
                              color: Colors.yellow,
                              size: 65,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),*/
                  Positioned(
                    bottom: 30.0,
                      child:
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    width: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: <Widget>[
                        Text(
                          movies[index].title,
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          ),

                        )
                      ],
                    ),
                  )
                  )
                ],
              );
            }),
            length: movies.take(5).length,



          )

        );

    }
  }

  }