import 'package:flutter/material.dart';

class OtherApps extends StatelessWidget {
  const OtherApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apps #2'),
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
                  color: Colors.red,
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/generator');
                          },
                          child: Text(
                            'Generator',
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
                            Navigator.pushNamed(context, '/predictNationality');
                          },
                          child: Text(
                            'Predict Nationality',
                            style: TextStyle(fontSize: 15),
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
                  color: Colors.green,
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink[300],
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'To be added',
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
                  color: Colors.grey,
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber[300],
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          onPressed: () {
                            // Navigator.pushNamed(context, '/otherapps');
                          },
                          child: Text(
                            'To be added',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
