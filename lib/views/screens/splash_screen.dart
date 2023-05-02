import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/styles/text_styles.dart';
import 'package:nba_stats_app/views/widgets/bottom_nav_bar.dart';
import 'package:nba_stats_app/views/widgets/buttons.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color green = const Color.fromARGB(255, 30, 255, 146);

  int generateRandInt() {
    final random = math.Random();
    return random.nextInt(3) + 1;
  }

  Image loadSplashImage() {
    final num = generateRandInt(); 
    return Image(
      image: AssetImage('assets/images/splash-${num}.jpg'),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AppWraper()
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black
      )
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Codapt"),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(
            flex: 1,
            child: loadSplashImage(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Colors.transparent,
                    // Color.fromARGB(148, 0, 0, 0),
                    // Color.fromARGB(150, 0, 0, 0),
                    // Color.fromARGB(174, 0, 0, 0),
                    // Color.fromARGB(183, 0, 0, 0),
                    // Color.fromARGB(213, 0, 0, 0),
                    // Color.fromARGB(222, 0, 0, 0),
                    // Color.fromARGB(236, 0, 0, 0),
                    // Color.fromARGB(239, 0, 0, 0),
                    // Color.fromARGB(244, 0, 0, 0),
                    // Colors.black,
                    // Colors.black,
                    // Colors.black,
                    // Colors.black,
                    // Colors.black,
                    // Colors.black,
                    Colors.transparent,
                    Colors.black,
                    Colors.black
                  ],
                  stops: [0.1, 0.5 ,1],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter
                )
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center
                  )
                ),
              ),
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 200
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "NBA STATISTICS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                    ),
                    softWrap: true,
                  )
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "FOR EVERY FAN!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                    softWrap: true
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: RoundedButton(
                      text: "Take Me There",
                      onPressed: () {navigateToHomeScreen();},
                    ),
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
