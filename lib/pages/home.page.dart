import 'package:flutter/material.dart';
import 'package:movity_app/widgets/switch.widget.dart';

import '../widgets/drawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyDrawer(),
        appBar: AppBar(
          title: Text(
            'Movity',
          ),
          actions: [
            MySwitch(),
          ],
        ),
        body: Center(
            child: Text("Home page",
                style: Theme.of(context).primaryTextTheme.headline1)));
  }
}
