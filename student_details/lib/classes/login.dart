// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = 'admin', password = '123', message = '';
  String userinputname = '', userinputpassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlutterLogo(
                size: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.lightBlue[100],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Username',
                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      userinputname = value.toString();
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.lightBlue[100],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 15),
                ),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  userinputpassword = value.toString();
                },
              ),
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  setState(() {
                    if (username == userinputname &&
                        password == userinputpassword) {
                      message = 'Login Successful';
                      Navigator.pushNamed(context, '/homepage');
                    } else {
                      message = 'Username or Password incorrect';
                    }
                  });
                },
              ),
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
