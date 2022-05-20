import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movity_app/UI/theme.ui.dart'as Style;
import 'package:movity_app/bloc/get_person.bloc.dart';
import 'package:movity_app/model/person_response.model.dart';

import '../model/person.model.dart';
class PersonList extends StatefulWidget {

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  void initState(){
    super.initState();
    personsBloc..getPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text("TRENDING ACTORS ON THIS WEEK", style: TextStyle(
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.0
          ),),
        ),
        SizedBox(
          height: 5.0,
        ),
    StreamBuilder<PersonResponse>(
    stream: personsBloc.subject.stream,
    builder: (context, AsyncSnapshot<PersonResponse> snapshot){
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

  Widget _buildPersonsWidget(PersonResponse ? data) {
    List <Person>? persons = data?.persons;
    if (persons!.length == 0) {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("No Actor"),
          ],
        ),
      );
    } else {
      return Container(
        height: 130.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            itemCount: persons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (xecontext, index) {
              return Container(
                width: 100.0,
                padding: EdgeInsets.only(
                    top: 10.0,
                    right: 10.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    persons[index].profileImg == null ?
                    Container(
                        width: 70.0,
                      height: 70.0,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.Colors.secondColor
                      ),
                      child: Icon(FontAwesomeIcons.users, color: Colors.white,),
                    ) :
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          //https://www.themoviedb.org/t/p/w600_and_h900_bestv2/14uxt0jH28J9zn4vNQNTae3Bmr7.jpg
                          //"https://image.tmdb.org/t/p/w200"+persons[index].profileImg
                          image: NetworkImage("https://image.tmdb.org/t/p/w200"+persons[index].profileImg),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(persons[index].name,
                    maxLines: 2,
                      style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0
                      ),

                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text("Trending for ${persons[index].known}", style: TextStyle(
                      color: Style.Colors.titleColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 7.0
                    ),)
                  ],
                ),
              );
            }),
      );
    }
  }

}
