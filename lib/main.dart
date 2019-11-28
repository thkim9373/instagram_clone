import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/material_white_color.dart';
import 'package:instagram_clone/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        primarySwatch: white,
      ),
    );
  }
}
