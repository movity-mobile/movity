import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
class QrGeneratorPage extends StatelessWidget {
  const QrGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        bottomNavigationBar: MyDrawer(),
        appBar: AppBar(title: Text('Movity',)),
        body: Center(
            child: Text("QR generator",
                style: TextStyle(fontSize: 60, color: Colors.white)
            )
        )
    );
  }
}