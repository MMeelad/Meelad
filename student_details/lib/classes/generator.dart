import 'package:flutter/material.dart';
import 'dart:math';

class Generator extends StatefulWidget {
  const Generator({Key? key}) : super(key: key);

  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  TextEditingController textController = TextEditingController();
  String password = "";

  String generatePassword(bool _isWithLetters, bool _isWithUppercase,
      bool _isWithNumbers, bool _isWithSpecial, int _numberCharPassword) {
    String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
    String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String _numbers = "0123456789";
    String _special = "@#=+!£\$%&?[](){}";

    String _allowedChars = "";

    _allowedChars += (_isWithLetters ? _lowerCaseLetters : '');
    _allowedChars += (_isWithUppercase ? _upperCaseLetters : '');
    _allowedChars += (_isWithNumbers ? _numbers : '');
    _allowedChars += (_isWithSpecial ? _special : '');

    int i = 0;
    String _result = "";

    while (i < _numberCharPassword.round()) {
      int randomInt = Random.secure().nextInt(_allowedChars.length);
      _result += _allowedChars[randomInt];
      i++;
    }

    return _result;
  }

  String getPassword(bool _isWithLetters, bool _isWithUppercase,
      bool _isWithNumbers, bool _isWithSpecial, int _numberCharPassword) {
    String generatedPassword = generatePassword(
        _isWithLetters, _isWithUppercase, _isWithNumbers, _isWithSpecial, 10);
    password = generatedPassword;
    print("Creating Password");
    return generatedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 1000,
                color: Colors.lightBlue[300],
                child: Text(
                  'Generate a password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 300,
                  child: Column(
                    children: [

                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              getPassword(true, true, true, false, 17);
                            });
                          },
                          child: Text('Generate a Password')),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(password,style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
