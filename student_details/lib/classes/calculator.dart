import 'dart:math';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double num1 = 0, num2 = 0, ans = 0;
  String oddOrEven = '',
      positiveOrNegative = '',
      primeOrNot = '',
      checkAns = '',
      ansNegative = '',
      ansPrime = '',
      ansOdd = '';
  int m = 0, counter = 0;

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  String checkOdd(double ans) {
    if (ans % 2 == 0) {
      oddOrEven = 'Even';
    } else if (ans % 2 != 0) {
      oddOrEven = 'Odd';
    } else {
      oddOrEven = 'Error';
    }
    return oddOrEven;
  }

  String checkNegative(double ans) {
    if (ans.isNegative) {
      positiveOrNegative = 'Negative';
    } else {
      positiveOrNegative = 'Postive';
    }
    return positiveOrNegative;
  }

  String checkPrime(double ans) {
    m = ans ~/ 2;
    for (int i = 2; i <= m; i++) {
      if (ans % i == 0) {
        primeOrNot = 'Not Prime';
        counter = 1;
        break;
      }

      if (counter == 0) {
        primeOrNot = 'Prime';
      }
    }
    return primeOrNot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Calculator App")),
          elevation: 1,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter value for Number 1",
                hintStyle: TextStyle(fontSize: 20),
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  num1 = double.parse(value);
                });
              },
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter value for Number 2",
                  hintStyle: TextStyle(fontSize: 20)),
              textAlign: TextAlign.center,
              onChanged: (value) {
                num2 = double.parse(value);
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ans = num1 + num2;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text(
                    "−",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ans = num1 - num2;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text(
                    "*",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ans = num1 * num2;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    "/",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ans = num1 / num2;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text(
                    "²",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ans = num1 * num1;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text(
                    "√",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ans = sqrt(num1);
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  ans.toString(),
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  height: 30,
                  child: ElevatedButton(
                      child: Text('Check answer'),
                      onPressed: () {
                        setState(() {
                          ansNegative = checkNegative(ans);
                          ansPrime = checkPrime(ans);
                          ansOdd = checkOdd(ans);
                          checkAns =
                              'The answer is $ansNegative, $ansOdd, $ansPrime';
                        });
                      }),
                ),
              ],
            ),
            Text(checkAns.toString())
          ],
        ));
  }
}
