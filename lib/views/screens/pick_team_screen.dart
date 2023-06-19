import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    void setFavouriteTeam(int teamId) async {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setInt('favouriteTeamId', teamId)
      .then((value) => {
        debugPrint("Team ID: $teamId Written to storage")
      })
      .catchError((err) => {
        debugPrint("Something went wrong: $err")
      });
    }

    void setFirstLaunch() async{
      final pref = await SharedPreferences.getInstance();

      await pref.setBool("isFirstLaunch", false)
      .then((value) => {
        debugPrint("Value Set")
      })
      .catchError((e) => {
        debugPrint("SOmething went wrong")
      });
    }

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