import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:nba_stats_app/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  void reset() async {
    final prefs = await SharedPreferences.getInstance();
    // reset username
    // prefs.setString("username", "");
    // // reset firstUse
    // prefs.setBool("isFirstLaunch", true);
    // // reset favteam
    // prefs.setInt("favoriteTeamId", -1);
    prefs.clear();

    debugPrint("Data reset!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SetttingsCard(
            onClick: (context) {
              // reset data
              showCupertinoDialog(
                context: context,
                builder: (context) => const CupertinoAlertDialog(
                title: Text("Warning"),
                content: Text("You are about to erase all  your data!"),
                actions: [
                  CupertinoDialogAction(child: Text("Yes")),
                  CupertinoDialogAction(child: Text("No")),
                ],
              )
              );
              reset();
              Phoenix.rebirth(context);
              debugPrint("app rest arted!");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Reset", 
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Delete all your data and start afresh on this device!",
                  style: TextStyle(
                    color: appColors.green
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


// Settings card with an onclick event!

class SetttingsCard extends StatelessWidget {
  const SetttingsCard({
    super.key,
    required this.child,
    required this.onClick
  });
  final Widget child;
  final void Function(BuildContext context) onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(context);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          color: appColors.lightGrey,
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          )
        ),
      ),
    );
  }
}