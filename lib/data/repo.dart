import 'package:nba_stats_app/data/apis/espn_core_api.dart';
import 'package:nba_stats_app/data/models/scoreboard_model.dart';
import 'package:nba_stats_app/data/models/team_model.dart';

/// Exposes data from different data sources
class Repo {
  final _espn = EsonCoreApi();

  Future<TeamModel> getTeamData(int teamId) {
    return _espn.getSingleTeamData(teamId);
  }

  Future<List<dynamic>> getTeams() async{
    return _espn.getTeams();
  } 

  Future<ScoreBoardModel> getScoreBoard() {
    return _espn.getScoreBoard();
  }

}

