import 'package:flutter/material.dart';

import '../widgets/drawar.widget.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).primaryColor,

        appBar: AppBar(title: Text('Movity',)),
        body: Center(
          child: Text("Home page",
              style: TextStyle(fontSize: 60, color: Colors.white)
        )

    ),
      drawer: MyDrawer(),
    );
  }
}