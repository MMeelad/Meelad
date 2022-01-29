import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apps #1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 110,
                  width: 170,
                  color: Colors.blue,
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/calculator');
                          },
                          child: Text(
                            'Calculator',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 110,
                  width: 170,
                  color: Colors.red,
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/chess');
                          },
                          child: Text(
                            'Chess',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 110,
                  width: 170,
                  color: Colors.pink[300],
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/todo');
                          },
                          child: Text(
                            'TODO App',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 110,
                  width: 170,
                  color: Colors.amber[300],
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/users');
                          },
                          child: Text(
                            'User Page',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  )),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/otherapps');
                  });
                },
                child: Text('Next Page', style: TextStyle(fontSize: 10)))
          ],
        ),
      ),
    );
  }
}
