class TeamModel {

  final int id;
  final String displayName;
  final String color;
  final String athletes;
  final String location;
  final String name;
  final String abbreviation;
  final String alternativeColor;
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

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json["id"],
      displayName: json["displayName"],
      color: json["color"],
      athletes: json["athletes"],
      location: json["location"],
      name: json["name"],
      abbreviation: json["abbreviation"],
      logoUrl: json["logos"][0]["href"],
      alternativeColor: json["alternativeColor"]
    );
  }

}
