import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_stats_app/data/models/team_model.dart';
import 'package:nba_stats_app/data/models/team_record_model.dart';
import 'package:nba_stats_app/styles/text_styles.dart';

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
    debugPrint(RecordModel.fromJson(data).summary);
    return RecordModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {

    getStats();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.data?.logoUrl ?? '',
                width: 70,
                height: 70,
              ),
            ),
            Text(
              widget.data?.displayName ?? '',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: widget.data?.color,
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FutureBuilder(
                future: getStats(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    RecordModel? data = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text("Swipe to view more records", style: TextStyle(
                            fontSize: 20
                          ),),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Metric(
                              lable: "Streak",
                              value: data?.streak ?? 'W1',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Wins",
                              value: data?.wins.toInt().toString() ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Loses",
                              value: data?.loses.toInt().toString() ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Win %",
                              value:  data?.winPerc.toStringAsFixed(2) ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Points Scored",
                              value: data?.pointsFor.toInt().toString() ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Points Against",
                              value: data?.pointsAgainst.toInt().toString() ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Points/Game",
                              value: data?.pointsPerGame.toStringAsFixed(2) ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                            Metric(
                              lable: "Ave Points Againts",
                              value: data?.avePointsAgainst.toStringAsFixed(2) ?? '0',
                              primary: widget.data?.color ?? Colors.amber ,
                              secondary: widget.data?.alternativeColor ?? Colors.amber,
                            ),
                          ],
                          ),
                        ),
                      ]
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: CircularProgressIndicator()
                    )
                  );
                },
            )
        ),
      );
  }
}


class Metric extends StatelessWidget {
  Metric({
    super.key,
    required this.lable,
    required this.value,
    required this.primary,
    required this.secondary,  
  });

  final String lable;
  final String value;
  final Color primary;
  final Color secondary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: 200,
          color: primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(lable, style: const TextStyle(
                fontSize: 20
              )),
              Text(value, style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              )),
            ],
          )
        ),
      ),
    );
  }
}