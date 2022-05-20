import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movity_app/UI/theme.ui.dart'as Style;
import 'package:movity_app/bloc/get_actor.bloc.dart';
import 'package:movity_app/constants.dart';
import 'package:movity_app/model/actors_response.model.dart';

import '../model/person.model.dart';
class actorList extends StatefulWidget {
  int? movieId;
  actorList(
    key , 
    this.movieId
    ):
    super (key: key);

  @override
  State<actorList> createState() => _actorListState(movieId!);
}

class _actorListState extends State<actorList> {
  final int movieId;
  _actorListState(this.movieId);
  @override
  void initState(){
    super.initState();
    actorBloc.getCredits(this.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: kDefaultPadding,
              ),
          child: Text("CAST", style: TextStyle(
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.0
          ),),
        ),
        
        const SizedBox(
          height: 5.0,
        ),
    StreamBuilder<ActorsResponse>(
    stream: actorBloc.subject.stream,
    builder: (context, AsyncSnapshot<ActorsResponse> snapshot){
    if(snapshot.hasData) {
    //&& snapshot.data?.error.length > 0

    return _buildPersonsWidget(snapshot.data);

    }else if (snapshot.hasError){
    return _buildErrorWidget(snapshot.data?.error);

    }else {
    return _buildLoadingWidget();
    }
    }
    )
      ],
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
        children: const <Widget>[
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

  Widget _buildPersonsWidget(ActorsResponse ? data) {
    List <Person>? persons = data?.persons;
    if (persons!.isEmpty) {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text("No Actor")
          ],
        ),
      );
    } else {
      return Container(
        height: 130.0,
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            itemCount: persons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 100.0,
                padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 10.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // ignore: unnecessary_null_comparison
                    persons[index].profileImg == null ?
                    Container(
                        width: 70.0,
                      height: 70.0,
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.Colors.secondColor
                      ),
                      child: const Icon(FontAwesomeIcons.users, color: Colors.white,),
                    ) :
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage("https://image.tmdb.org/t/p/w200"+persons[index].profileImg),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(persons[index].name,
                    maxLines: 2,
                      style: const TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0
                      ),

                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text("${persons[index].name}", style: const TextStyle(
                      color: Style.Colors.titleColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 9.0
                    ),)
                  ],
                ),
              );
            }),
      );
    }
  }

}
