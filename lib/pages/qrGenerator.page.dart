import 'package:flutter/material.dart';

import '../widgets/drawar.widget.dart';
class QrGeneratorPage extends StatelessWidget {
  const QrGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Movity',)),
        body: Center(
            child: Text("QR generator",
                style: TextStyle(fontSize: 60, color: Colors.white)
            )
        )
    );
  }
}