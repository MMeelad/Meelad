import 'package:flutter/material.dart';

class exam extends StatefulWidget {
  const exam({ Key? key }) : super(key: key);

  @override
  _examState createState() => _examState();
}

class _examState extends State<exam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/logo.png'),),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(decoration: InputDecoration(hintText: 'Email')),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(decoration: InputDecoration(hintText: 'Password')),
          ),
          Container(
            width: 370,
            child: ElevatedButton(onPressed: (){
              setState(() {
                
              });
            },
            child: Text('Login')),
          )
        ],
      )
    );
  }
}