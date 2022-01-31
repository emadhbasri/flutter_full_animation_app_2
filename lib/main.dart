import 'package:flutter/material.dart';

import 'full_animation_ui_cake.dart';
import 'functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'full Animation Ui Cake',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        screenSize = MediaQuery.of(context).size;
        return const FullAnimationUiCake();
      }),
    );
  }
}
