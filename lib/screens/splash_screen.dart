import 'package:flutter/material.dart';
import 'package:nba_stats_app/screens/league_screen.dart';
import 'package:nba_stats_app/styles/text_styles.dart';
import 'package:nba_stats_app/widgets/bottom_nav_bar.dart';
import 'package:nba_stats_app/widgets/buttons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color green = const Color.fromARGB(255, 30, 255, 146);

  Image loadSplashImage() {
    return const Image(
      image: AssetImage('assets/images/splash.png'),
    );
  }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomButtomBar()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black54,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Codapt"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Center(child: loadSplashImage()),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Welcome to the NBA Stats App",
                          style: h1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        "By Codapt 💚",
                        style: p1,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                )),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: RoundedButton(
                    text: "Take me there",
                    color: green,
                    onPressed: () => navigateToHomeScreen()
                  ),
                ),
              ),
          ],
        ),
    ));
  }
}
