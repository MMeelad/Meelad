import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Userpage extends StatefulWidget {
  Userpage({Key? key}) : super(key: key);

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  String _url =
      "https://fakerapi.it/api/v1/persons?_quantity=6&_gender=male&_birthday_start=2005-01-01";

  List<Map<String, dynamic>> _users = [];
  bool loading = true;

  void _getDataFromApi() async {
    var response = await http.get(Uri.parse(_url));
    var userJsonData = jsonDecode(response.body);

    userJsonData["data"].asMap().forEach((index, value) {
      _users.add({
        "firstName": value['firstname'],
        "lastName": value['lastname'],
        "email": value['email'],
        "street": value['address']['street'],
        "streetName": value['address']['streetName'],
        "latitude": value['address']['latitude'],
        "longitude": value['address']['longitude'],
        "image": value['image'],
      });
    });

    setState(() {
      _users = _users;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserPage'),
        centerTitle: true,
      ),
      body: Center(
        child: loading ? CircularProgressIndicator() :  Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(
              itemCount: _users.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            // print(_users[index]);
                            Navigator.pushNamed(context, '/singleUser',
                                arguments: _users[index]);
                          },
                          child: Image.network(_users[index]['image'])),
                      Text(
                          "${_users[index]['firstName']} ${_users[index]['lastName']}"),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
