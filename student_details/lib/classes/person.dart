// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    Person({
        required this.name,
        required this.country,
    });

    String name;
    List<Country> country;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
    };
}

class Country {
    Country({
        required this.countryId,
        required this.probability,
    });

    String countryId;
    double probability;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        probability: json["probability"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "probability": probability,
    };
}
