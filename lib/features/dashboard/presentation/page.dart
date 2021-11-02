import 'package:baricode_app/core/constant/color.dart';
import 'package:baricode_app/features/create/presentation/create/page.dart';
import 'package:baricode_app/features/scan/presentation/scan/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gPrimaryColor,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            child: Center(
              child: Text(
                'BARICODE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: gPrimaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Color(0XFFBC6FF1),
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => ScanPage()));
                          },
                          child: Container(
                            width: 140,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Ionicons.qr_code,
                                  size: 40,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'SCAN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreatePage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Ionicons.create,
                                  size: 40,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'CREATE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
