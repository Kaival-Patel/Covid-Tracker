import 'package:flutter/material.dart';
import 'Screens/HomePage.dart';
void main() => runApp(App());


//Our main App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      title: 'Covid-19',
      home: HomePage(),
    );
  }
}