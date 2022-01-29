import 'package:flutter/material.dart';

class test3 extends StatefulWidget {
  const test3({Key? key}) : super(key: key);

  @override
  _test3State createState() => _test3State();
}

class _test3State extends State<test3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alignment')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(height: 100, width: 100, color: Colors.red, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        
                      });
                    }, child: Text('Button')),
                  ],
                ),
              ),
              Container(height: 100, width: 100, color: Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            Container(height: 100, width: 100, color: Colors.yellow),
            Container(height: 100, width: 100, color: Colors.grey),
          ])
        ],
      ),
    );
  }
}
