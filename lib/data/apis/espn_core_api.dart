import "package:http/http.dart" as http;
import "dart:convert";

import "package:nba_stats_app/data/models/team_model.dart";


class EsonCoreApi {

  Future<TeamModel> getSingleTeamData(int teamId) async {
    var url = Uri.parse("http://sports.core.api.espn.com/v2/sports/basketball/leagues/nba/seasons/2023/teams/$teamId");
    var res = await http.get(url);
    Map<String, dynamic> team = jsonDecode(res.body);
    return TeamModel(team);
  }

}