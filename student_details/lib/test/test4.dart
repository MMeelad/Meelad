import 'package:flutter/material.dart';

class test4 extends StatefulWidget {
  const test4({Key? key}) : super(key: key);

  @override
  _test4State createState() => _test4State();
}

class _test4State extends State<test4> {
  double num1 = 0, num2 = 0;
  double ans = 0;

  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Column(
          children: [
            TextField(
                controller: textController1,
                decoration: InputDecoration(hintText: 'Number 1'),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    num1 = double.parse(value);
                  });
                }),
            TextField(
                controller: textController2,
                decoration: InputDecoration(hintText: 'Number 2'),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    num2 = double.parse(value);
                  });
                }),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ans = num1 + num2;
                    });
                  },
                  child: Text('+')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ans = num1 - num2;
                    });
                  },
                  child: Text('-')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ans = num1 * num2;
                    });
                  },
                  child: Text('*')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ans = num1 / num2;
                    });
                  },
                  child: Text('/')),
            ]),
            Text(
              ans.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ],
        ));
  }
}
