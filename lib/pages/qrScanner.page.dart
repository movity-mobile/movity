import 'package:flutter/material.dart';
import 'package:movity_app/widgets/drawar.widget.dart';
import 'package:movity_app/widgets/switch.widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QRViewScannerPageState();
}

class _QRViewScannerPageState extends State<QrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController qrViewController;
  Barcode? barcode;
  String? data = "Scanned Code";
  bool viewQRScan = true;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'QR Scanner',
        ),
        actions: [
          IconButton(
              onPressed: () {
                qrViewController.flipCamera();
              },
              icon: Icon(Icons.flip)),
          MySwitch(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: (!viewQRScan)
                  ? QrImage(data: "${data}")
                  : Container(
                      padding: EdgeInsets.all(20),
                      child: QRView(
                        overlay: QrScannerOverlayShape(
                            borderColor: Theme.of(context).primaryColor,
                            borderLength: 20,
                            borderWidth: 20,
                            cutOutSize:
                                MediaQuery.of(context).size.width * 0.8),
                        key: qrKey,
                        onQRViewCreated: (qrViewController) {
                          this.qrViewController = qrViewController;
                          qrViewController.scannedDataStream.listen((barCode) {
                            setState(() {
                              barcode = barCode;
                              data = barCode.code;
                              textEditingController.text = data!;
                              viewQRScan = false;
                            });
                          });
                        },
                      ),
                    )),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: Theme.of(context).primaryTextTheme.headline6,
                  decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1),)),
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    qrViewController.dispose();
    super.dispose();
  }
}
