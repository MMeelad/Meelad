// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blueGrey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: true
                        ? NetworkImage(args['image'])
                        : AssetImage('assets/images/noImageAvailable.png')
                            as ImageProvider,
                    radius: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Full Name: ${args["firstName"]}  ${args["lastName"]}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Email: ${args["email"]}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Street: ${args["street"]}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Street name: ${args["streetName"]}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Latitude: ${args["latitude"]}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Longitude: ${args["longitude"]}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
