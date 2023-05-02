class RecordModel {
  final double wins;
  final double loses;
  final double winPerc;
  final String streak;
  final double pointsFor;
  final double pointsPerGame;
  final double avePointsAgainst;
  final double pointsAgainst;
  final String projection;
  final String summary;

  RecordModel({
    required this.wins,
    required this.loses,
    required this.winPerc,
    required this.streak,
    required this.pointsFor,
    required this.pointsPerGame,
    required this.avePointsAgainst,
    required this.pointsAgainst,
    required this.projection,
    required this.summary
  });

  // recieves json as it is
  factory RecordModel.fromJson(dynamic json) {
    dynamic ovr = json['items'][0]["stats"];
    dynamic summary = json["items"][0]["summary"];

    return RecordModel(
      wins: ovr[19]["value"],
      loses: ovr[10]["value"],
      winPerc: ovr[18]["value"] * 100,
      streak: ovr[16]["displayValue"],
      pointsFor: ovr[15]["value"],
      pointsPerGame: ovr[3]["value"],
      avePointsAgainst: ovr[2]["value"],
      pointsAgainst: ovr[14]["value"],
      projection: ovr[11]["description"],
      summary: summary,
    );
  }
}