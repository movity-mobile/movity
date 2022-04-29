import 'package:flutter/material.dart';

import '../widgets/drawar.widget.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Movity',)),
        body: Center(
            child: Text("Search page",
                style: TextStyle(fontSize: 60, color: Colors.white)
            )
        )
    );
  }
}