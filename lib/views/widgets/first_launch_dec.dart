import "package:flutter/material.dart";
import 'package:nba_stats_app/views/screens/home_screen.dart';
import "package:nba_stats_app/views/screens/splash_screen.dart";
import "package:nba_stats_app/views/widgets/app_wraper.dart";
import "package:shared_preferences/shared_preferences.dart";

class FirstLaunchDectection extends StatefulWidget {
  const FirstLaunchDectection({super.key});

  @override
  State<FirstLaunchDectection> createState() => _FirstLaunchDectectionState();
}

class _FirstLaunchDectectionState extends State<FirstLaunchDectection> {
  bool isFirstLaunch = false;
  Widget gotTo = const Center(
    child: CircularProgressIndicator(),
  );

  void getPrefs() async {
    await SharedPreferences.getInstance().then((value) async {
      setState(() {
        isFirstLaunch = value.getBool("isFirstLaunch") ?? true;
      });
    });
    
  }


  @override
  Widget build(BuildContext context) {

    getPrefs();
    if(isFirstLaunch == true) {
      gotTo = const SplashScreen();
    } else {
      gotTo = const AppWraper();
    }
    
    return Center(
      child: gotTo
    );
  }
}