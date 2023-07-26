import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/themes/colors.dart';
import 'package:nba_stats_app/views/screens/pick_team_screen.dart';
import 'package:nba_stats_app/views/widgets/buttons.dart';
import 'package:nba_stats_app/views/widgets/rounded_inpu_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/app_wraper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});


  @override
  State<OnBoardingScreen> createState() {
    return _OnBoardingScreenState();
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  String username = ""; 

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
        systemNavigationBarContrastEnforced: true,
      )
    );
    super.initState();
  }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AppWraper()
      )
    );
  }

  void setUsername() async{
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', username)
    .then((value) => {
      debugPrint("Username: $username Written to Storage")
    })
    .catchError((err) => {
      debugPrint(err)
    });

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Codapt"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What should we call you?",
              softWrap: true,
              style: TextStyle(
                fontSize: 50,
                color: appColors.green
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RoundedInput(
                  onInput: (value) {
                    setState(() {
                      username = value;
                      debugPrint(username);
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: RoundedButton(
                text: "Continue",
                onPressed: () {
                  setUsername();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PickTeamScreen()
                    )
                  );
                },
                color: appColors.green,
              ),
            )    

          ],
        ),
      ),
      backgroundColor: appColors.surfaceGrey,
    );
  }
}