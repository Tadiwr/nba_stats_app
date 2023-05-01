// ignore_for_file: prefer_typing_uninitialized_variables

class TeamModel {

  var id;
  var displayName;
  var color;
  var athletes;
  var location;
  var name;
  var abbreviation;
  var alternativeColor;
  var logoUrl;

  TeamModel(Map<String, dynamic> json) {
    id = json["id"];
    displayName = json["displayName"];
    color = json["color"];
    athletes = json["athletes"];
    location = json["location"];
    name = json["name"];
    abbreviation = json["abbreviation"];
    logoUrl = json["logos"][0];
    alternativeColor = json["alternativeColor"];
  }

}
