import 'package:flutter/material.dart';

import '../widgets/drawar.widget.dart';
class QrScannerPage extends StatelessWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Movity',)),
        body: Center(
            child: Text("QR Scanner",
                style: TextStyle(fontSize: 60, color: Colors.white)
            )
        )
    );
  }
}