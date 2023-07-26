import 'package:flutter/material.dart';
import 'package:nba_stats_app/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/favourite_team.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String username = "Username";
  int favTeamId = -1;

  void loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username") ?? "Username Not Found!"; 
    });
    debugPrint(username);
  }

  void loadFavouriteTeam() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favTeamId = prefs.getInt("favouriteTeamId") ?? -1; 
    });
    debugPrint("Favourite Team: $favTeamId");
  }

  @override
  void initState() {
    super.initState();
    // Load username from disk
    loadUsername();

    // load favourite team id
    loadFavouriteTeam();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome $username!",
          softWrap: true,
          maxLines: 3,
        ),
        centerTitle: true,
        titleTextStyle: h3,
        toolbarHeight: 80,
      ),
      body: ListView(
        
        children: [
          Center(
            child: FavouriteTeam(teamId: favTeamId,),
          ),
        ],
      )
    );
  }
}