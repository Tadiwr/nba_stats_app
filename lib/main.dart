import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/views/widgets/first_launch_dec.dart';
import 'package:nba_stats_app/themes/default_dark_theme.dart';
import 'package:nba_stats_app/themes/colors.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      systemNavigationBarColor: appColors.surfaceGrey,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light
  ));

  runApp(const Core());
}

// Core app entry point
class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Nba Stats",
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,

      // Decides whether to navigate to splash screen
      // or home screen;

      home: const FirstLaunchDectection()
    );
  }
}

