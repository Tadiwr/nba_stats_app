import "package:flutter/services.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import "package:nba_stats_app/data/models/team_model.dart";

import "../models/scoreboard_model.dart";

class EsonCoreApi {

  Future<TeamModel> getSingleTeamData(int teamId) async {
    var url = Uri.parse("http://sports.core.api.espn.com/v2/sports/basketball/leagues/nba/seasons/2023/teams/$teamId");
    var res = await http.get(url);
    Map<String, dynamic> team = jsonDecode(res.body);
    return TeamModel.fromJson(team);
  }

  // Future<AthletesModel> getAthletes(int teamId) async {

  // } 

  Future<List<dynamic>> getTeams() async{
    var jsonString = await rootBundle.loadString('assets/json/teams.json');
    List<dynamic> data = json.decode(jsonString);  
    return data;
  }   

  Future<ScoreBoardModel> getScoreBoard() async {
    final url = Uri.https("site.api.espn.com", "/apis/site/v2/sports/basketball/nba/scoreboard");
    final res = await http.get(url);
    final payload = jsonDecode(res.body);
    return ScoreBoardModel.fromJson(payload);
  }

}