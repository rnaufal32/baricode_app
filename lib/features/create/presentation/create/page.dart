import 'dart:io';

import 'package:barcode_image/barcode_image.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:baricode_app/core/constant/color.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:image/image.dart' hide Color;

class CreatePage extends StatelessWidget {
  CreatePage({Key? key}) : super(key: key);

  final code = 'Input Here'.inj();

  void shareBtn() async {
    final image = Image(400, 400);
    fill(image, getColor(255, 255, 255));
    drawBarcode(image, Barcode.qrCode(), code.state, font: arial_24);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final file = await File('$appDocPath/test.png').create();
    file.writeAsBytesSync(encodePng(image));
    await Share.shareFiles([
      file.path,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Barcode'),
        backgroundColor: gPrimaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: OnReactive(
                      () => BarcodeWidget(
                        data: code.state,
                        barcode: Barcode.qrCode(),
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: 'Input Here',
                    decoration: InputDecoration(
                      labelText: 'Code',
                    ),
                    onChanged: (text) {
                      code.state = text;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            child: Text('SHARE'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(gPrimaryColor),
            ),
            onPressed: shareBtn,
          ),
        ],
      ),
    );
  }
}
