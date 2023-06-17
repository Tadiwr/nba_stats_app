// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/styles/text_styles.dart';
import 'package:nba_stats_app/views/screens/on_boarding_screen.dart';
import 'package:nba_stats_app/views/widgets/buttons.dart';
import 'dart:math' as math;
import 'package:nba_stats_app/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  int imageNumber = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        setState(() {
          imageNumber = generateRandImageNum();
        });
      }
    );
  }

  int generateRandImageNum() {
      final random = math.Random();
      return random.nextInt(10) + 1;
  }

  Image loadSplashImage(int num) {
    return Image(
      image: AssetImage('assets/images/splash-$num.jpg'),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  void navigateToOnBoarding() {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen()
      )
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
        systemNavigationBarContrastEnforced: true,
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.green
      )
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: appColors.green,
      appBar: AppBar(
        title: const Text("Codapt"),
        backgroundColor: Colors.transparent,
      ),

      // Stack of widgets
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          // image at the botttom
          FadeIn(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: loadSplashImage(imageNumber),
            ),
          ),

          // gradient
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  appColors.green,
                  Colors.transparent
                ]
              )
            ),
          ),

          FadeInUp(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "NBA Statistics For Every Fan",
                      softWrap: true,
                      maxLines: 3,
                      style: h1.copyWith(
                        fontSize: 55
                      ),
                    ),
            
                    FadeInLeft(
                      child: RoundedButton(
                        text: "Take Me There",
                        color: appColors.darkGrey,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          navigateToOnBoarding();
                        },
                      ),
                    )
            
                  ],
                ),  
              ),
            ),
          )
          // text and button
        ],
      ),
    );

  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: appColors.surfaceGrey,
        systemNavigationBarContrastEnforced: true,
      )
    );

    super.dispose();
    _timer.cancel();
  }
}
