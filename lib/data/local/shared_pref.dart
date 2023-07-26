import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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