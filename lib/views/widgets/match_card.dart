import 'package:flutter/material.dart';
import 'package:nba_stats_app/data/models/scoreboard_model.dart';
import 'package:nba_stats_app/styles/text_styles.dart';
import 'package:nba_stats_app/themes/colors.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key , required this.data});

  final EventModel? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: appColors.lightGrey,
          width: double.infinity,
          height: 220,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opponent(data : data?.competitors[0]),
              Column(
                children: [
                  Expanded(
                    child: Text(
                      data?.status.description ?? "",
                      style: h3,
                  )),
                  const Expanded(
                    child: Text("VS", style: h3,),
                  ),
                ],
              ),
              Opponent(data : data?.competitors[1]),
            ],
          ) ,
        ),
      ),
    );
  }
}


class Opponent extends StatelessWidget {
  const Opponent({super.key, required this.data});

  final Competitor? data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
                data?.logoUrl ?? "",
            ),
          ),
          // Name
          SizedBox(
            height: 20,
            child: Text(data?.displayName ?? ""),
          ),
          // Score
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                data?.score ?? "", 
                style: h1
              )),
          ),
        ],
      )
    );
  }
}