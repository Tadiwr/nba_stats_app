class WinsLosesModel {
  final String teamName;
  final int teamId;
  final int wins;
  final int loses;
  final double winPercentage;

  WinsLosesModel({
    required this.wins,
    required this.loses,
    required this.teamName,
    required this.winPercentage,
    required this.teamId
  });
}