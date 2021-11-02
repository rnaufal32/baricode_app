import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ResultPage extends StatelessWidget {
  final Barcode barcode;
  const ResultPage({
    Key? key,
    required this.barcode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Format : ${barcode.format.formatName}'),
                  SizedBox(height: 5),
                  Text(barcode.code),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
