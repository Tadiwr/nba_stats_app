import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_stats_app/data/models/team_model.dart';
import 'package:nba_stats_app/data/models/team_record_model.dart';

class TeamDetailsScreen extends StatefulWidget {
  const TeamDetailsScreen({super.key, required this.teamId});

  final int teamId;

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> { 

  Future<TeamModel> getTeamData() async {
    var url = Uri.http("sports.core.api.espn.com", "/v2/sports/basketball/leagues/nba/seasons/2023/teams/${widget.teamId}");
    http.Response res = await http.get(url);
    var jsonData = jsonDecode(res.body);
    return TeamModel.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTeamData(),
      builder: (context, snapshot) {
        late TeamModel? data;

        if (snapshot.hasData) {
          data = snapshot.data;
          return Details(data: data);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}


class Details extends StatefulWidget {
  const Details({super.key, required this.data});

  final TeamModel? data;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  Future<RecordModel> getStats() async {
    var url = Uri.http("sports.core.api.espn.com","v2/sports/basketball/leagues/nba/seasons/2023/types/2/teams/${widget.data?.id ?? ''}/record");
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return RecordModel.fromJson(data);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Team Logo
            SizedBox(
              width: 50,
              height: 50,
              child: Expanded(
                flex: 1,
                child: Image.network(
                  widget.data?.logoUrl ?? '',
                ),
              ),
            ),
            // Team Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                flex: 6,
                child: Text(widget.data?.displayName ?? ''),
              ),
            )
          ],
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: widget.data?.color,
      ),
      body: Column(
        children : [
          // Linear Gradient
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.data?.color ?? Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: SizedBox(
              child: FutureBuilder(
                future: getStats(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final stats = snapshot.data;
                    return Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "The ${widget.data?.displayName} are ${stats?.projection}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              softWrap: true,
                            ),
                            
                          )
                        ),
                        Expanded(
                          flex: 5,
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: [
                              Metric(lable: "Form", value: stats?.summary ?? ''),
                              Metric(lable: "Wins", value: stats?.wins.toStringAsFixed(0) ?? ''),
                              Metric(lable: "Loses", value: stats?.loses.toStringAsFixed(0) ?? ''),
                              Metric(lable: "Win %", value: stats?.winPerc.toStringAsFixed(2) ?? ''),
                              Metric(lable: "Points Scored", value: stats?.pointsFor.toStringAsFixed(0) ?? ''),
                              Metric(lable: "Average Points", value: stats?.wins.toStringAsFixed(0) ?? ''),
                              Metric(lable: "Points Against", value: stats?.pointsAgainst.toStringAsFixed(0) ?? ''),
                              Metric(lable: "Streak", value: stats?.streak ?? ''),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          )
          // Main Content
        ]
      ),
    );
  }


}


class Metric extends StatelessWidget {
  const Metric({
    super.key,
    required this.lable,
    required this.value,  
  });

  final String lable;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: 200,
          color: const Color.fromARGB(255, 24, 24, 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(lable, style: const TextStyle(
                fontSize: 20,
              ), softWrap: true, textAlign: TextAlign.center,
              ),
              Text(value, style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              )),
            ],
          )
        ),
      ),
    );
  }
}