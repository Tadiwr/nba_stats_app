class TeamMiniModel {
  final String id;
  final String name;
  final String abbrv;

  TeamMiniModel({
    required this.id,
    required this.abbrv,
    required this.name,
  });

  factory TeamMiniModel.fromJson(Map<String, dynamic> json) {
    return TeamMiniModel(
      id: json["id"],
      name: json['name'],
      abbrv: json["abbreviation"]
    );
  }

}