import 'package:flutter/material.dart';
import 'package:general_blockchain/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.teal[400],
          accentColor: Colors.deepOrange[200],
          brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
