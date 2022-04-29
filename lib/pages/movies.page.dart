import 'package:flutter/material.dart';

import '../widgets/drawar.widget.dart';
class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      appBar: AppBar(title: Text('Movity',)),
      body: Center(
          child: Text("movies page",
              style: TextStyle(fontSize: 60, color: Colors.white)
          )

      ),
      drawer: MyDrawer(),
    );
  }
}