import 'package:api_tutorial/example_five.dart';
import 'package:api_tutorial/example_four.dart';
import 'package:api_tutorial/example_three.dart';
import 'package:api_tutorial/example_two.dart';
import 'package:api_tutorial/home_screen.dart';
import 'package:api_tutorial/signup.dart';
import 'package:api_tutorial/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadImageScreen(),
    );
  }
}

