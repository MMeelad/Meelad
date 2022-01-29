// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_details/classes/class2_todo.dart';
import 'package:student_details/classes/calculator.dart';
import 'package:student_details/classes/chess.dart';
import 'package:student_details/classes/class1_navigation.dart';
import 'package:student_details/classes/class3_userpage.dart';
import 'package:student_details/classes/class4_single_detail.dart';
import 'package:student_details/classes/class5_predictNationality.dart';
import 'package:student_details/classes/generator.dart';
import 'package:student_details/classes/login.dart';
import 'package:student_details/classes/otherapps.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      routes: {
      '/': (context) => Login(),
      '/homepage': (context) => Homepage(),
      '/calculator': (context) => Calculator(),
      '/chess': (context) => Chess(),
      '/todo': (context) => todo(),
      '/users': (context) => Userpage(),
      '/otherapps': (context) => OtherApps(),
      '/generator': (context) => Generator(),
      '/singleUser': (context) => DetailPage(),
      '/predictNationality': (context) => PredictNationality(),
    }
    );
  }
}
