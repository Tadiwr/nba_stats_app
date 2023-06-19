import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/views/screens/team_details_screen.dart';
import 'package:nba_stats_app/views/widgets/team_card.dart';
import "package:nba_stats_app/data/apis/espn_core_api.dart";

import '../../themes/colors.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
        systemNavigationBarContrastEnforced: true,
      )
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams")
      ),
      body: FutureBuilder(
        future: EsonCoreApi().getTeams(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return TeamCard(
                  teamName: list?[index]["team"],
                  teamAbrreviation: list?[index]["abbreviation"],
                  teamId: list?[index]["id"],
                  onPressed: (teamId) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamDetailsScreen(
                          teamId: list?[index]["id"],
                        ) 
                      )
                    );
                  },
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator()
          );
        }),

      ),
    );
  }
}