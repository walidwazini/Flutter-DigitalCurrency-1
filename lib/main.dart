import 'package:flutter/material.dart';

import './PriceScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
