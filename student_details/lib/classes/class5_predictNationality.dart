// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:convert';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:student_details/classes/person.dart';

class PredictNationality extends StatefulWidget {
  PredictNationality({Key? key}) : super(key: key);

  @override
  State<PredictNationality> createState() => _PredictNationalityState();
}

class _PredictNationalityState extends State<PredictNationality> {
  TextEditingController textCon = new TextEditingController();
  //https://api.nationalize.io/?name=mohammad
  var res = [];

  predictNationality(String name) async {
    await CountryCodes.init();

    var url = Uri.https(
      'api.nationalize.io',
      '/',
      {
        'name': name,
      },
    );
    Response response = await get(url);
    //SELECT * FROM person WHERE name = bashir;

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      // List<Person> predictedList = responseBody
      //     .map(
      //       (Map<String, dynamic> item) => Person.fromJson(item),
      //     )
      //     .toList();
      //print(responseBody['name']);
      setState(() {
        res = responseBody['country'];
      });
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Predict Nationality')),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter your name to predict your Nationaliy:',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: textCon,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //print(textCon.text);
                      await predictNationality(textCon.text);
                      print(res);
                    },
                    child: Text("Predict"),
                  ),
                  // Text("${textCon.text}")
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: res.length,
                itemBuilder: (context, index) {
                  Locale? deviceLocale = CountryCodes.getDeviceLocale();
                  CountryDetails details = CountryCodes.detailsForLocale();
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text("${details.name} (${res[index]['country_id']})",
                          style: TextStyle(fontSize: 20)),
                      subtitle: Text("${res[index]['probability']}",
                          style: TextStyle(fontSize: 18)),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
