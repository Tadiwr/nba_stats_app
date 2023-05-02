import 'package:flutter/services.dart';

class TeamModel {

  final String id;
  final String displayName;
  final Color color;
  final String athletes;
  final String location;
  final String name;
  final String abbreviation;
  final Color alternativeColor;
  final String logoUrl;

  TeamModel({
    required this.id,
    required this.displayName,
    required this.color,
    required this.athletes, 
    required this.location,
    required this.name,
    required this.abbreviation,
    required this.logoUrl,
    required this.alternativeColor
  });

  factory TeamModel.fromJson(dynamic json) {
    return TeamModel(
      id: json["id"],
      displayName: json["displayName"],
      color : Color(int.parse(json["color"], radix: 16)).withOpacity(1.0),
      athletes: json["athletes"]['\$ref'],
      location: json["location"],
      name: json["name"],
      abbreviation: json["abbreviation"],
      logoUrl: json["logos"][0]["href"],
      alternativeColor:Color(int.parse(json["alternateColor"] , radix: 16)).withOpacity(1.0)
    );
  }

}
