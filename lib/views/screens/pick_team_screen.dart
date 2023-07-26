import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/data/local/shared_pref.dart';
import 'package:nba_stats_app/views/widgets/app_wraper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/apis/espn_core_api.dart';
import '../widgets/team_card.dart';

class PickTeamScreen extends StatefulWidget {
  const PickTeamScreen({super.key});

  @override
  State<PickTeamScreen> createState() => _PickTeamScreenState();
}

class _PickTeamScreenState extends State<PickTeamScreen> {

  

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarContrastEnforced: true,
      )
    );  

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Pick your favourite"),
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
                      setFavouriteTeam(teamId);
                      setFirstLaunch();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppWraper() 
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