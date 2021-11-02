import 'dart:async';
import 'dart:io';

import 'package:baricode_app/features/scan/presentation/result/page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Completer<QRViewController> qrController = Completer();

  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration(seconds: 2)).then((value) {
    //   Navigator.push(context, MaterialPageRoute(builder: (_) => ResultPage()));
    // });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() async {
    super.reassemble();

    final controller = await qrController.future;

    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    final controller = await qrController.future;
    controller.dispose();
  }

  void goToResult(Barcode barcode) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => ResultPage(barcode: barcode),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: (controller) {
          qrController.complete(controller);
          controller.scannedDataStream.listen(
            (event) {
              controller.pauseCamera();
              goToResult(event);
            },
          );
        },
      ),
    );
  }
}
