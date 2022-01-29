// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chess',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Chess(),
    );
  }
}

class Chess extends StatefulWidget {
  @override
  _ChessState createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chess"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ChessBoard(
            onMove: (move) {
              print(move);
            },
            onCheckMate: (color) {
              print(color);
            },
            onDraw: () {},
            size: MediaQuery.of(context).size.width,
            enableUserMoves: true,
            boardType: BoardType.orange,
          )
        ],
      )),
    );
  }
}
