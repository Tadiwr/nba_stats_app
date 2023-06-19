import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nba_stats_app/data/models/team_model.dart';
import 'package:nba_stats_app/views/screens/team_details_screen.dart';
import 'package:http/http.dart' as http;

class TeamCard extends StatefulWidget {
  const TeamCard({
    super.key,
    required this.teamId,
    required this.teamName,
    required this.teamAbrreviation,
    required this.onPressed,
  });

  final String teamName;
  final String teamAbrreviation;
  final int teamId;
  final Function(int) onPressed;

  @override
  State<TeamCard> createState() => _TeamCardState();
}



class _TeamCardState extends State<TeamCard> {


  Future<String> getTeamLogo() async{
    var url = Uri.http("sports.core.api.espn.com", "/v2/sports/basketball/leagues/nba/seasons/2023/teams/${widget.teamId}");
    http.Response res = await http.get(url);
    var jsonData = jsonDecode(res.body);
    String logoUrl = TeamModel.fromJson(jsonData).logoUrl;
    return logoUrl;
  }

  void navigateToTeamDetails(BuildContext context, int id) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TeamDetailsScreen(teamId: id,)
    )
  );
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          color: const Color.fromARGB(255, 32, 32, 32),
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: FutureBuilder(
                      future: getTeamLogo(),
                      builder: (context, snapshot) {
                  
                        if (snapshot.hasData) {
                          return Image.network(snapshot.data ?? '');
                        }
                  
                        return const Center(
                          child: Icon(Icons.shield),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.teamName, style: const TextStyle(
                        fontSize: 20,
                        color: CupertinoColors.activeGreen,
                      ),),
                      Text(widget.teamAbrreviation, style: const TextStyle(
                        color: Colors.grey
                      ),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      widget.onPressed(widget.teamId);
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}