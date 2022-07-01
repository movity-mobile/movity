import 'package:flutter/material.dart';
import 'package:movity_app/pages/qrScanner.page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../widgets/drawar.widget.dart';
import 'package:movity_app/UI/theme.ui.dart' as Style;

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => QrGeneratorPage();
}

class QrGeneratorPage extends State<QRCodePage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: const Text('générateur QRCode')),

      body: Column(
        children: [
          QrImage(
            data: data,
            size: 200,
          ),
          Form(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'First Name : ',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Last Name : ',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                    controller: _controller1,
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Ref Code : ',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                    controller: _controller2,
                    onChanged: (value) {
                      setState(() {

                        print(data);
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(

                    children: [
                      TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Style.Colors.titleColor,),
                          ),
                          onPressed: () {
                            _controller.clear();
                            _controller1.clear();
                            _controller2.clear();
                            setState(() {
                              data = "";
                            });
                          },
                          child: Text('Rénitialiser')
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Style.Colors.titleColor,),
                            ),
                            onPressed: () {

                              setState(() {
                                data = _controller.text + ' ' + _controller1.text + ' '+_controller2.text;
                              });
                            },
                            child: Text('Générer')
                        ),
                      )
                    ],),
                ),

              ],
            ),
          ),
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.qr_code_2_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QrScannerPage( ),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}