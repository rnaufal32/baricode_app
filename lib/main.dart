import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/dashboard/presentation/page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baricode',
      home: HomePage(),
    );
  }
}
