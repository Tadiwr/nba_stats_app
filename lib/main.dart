import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/themes/colors.dart';
import 'package:nba_stats_app/views/screens/splash_screen.dart';

void main() {

  // Sets the color of the navigation bar on android
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      systemNavigationBarColor: appColors.surfaceGrey,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light
  ));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nba Stats",
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,

      // TODO: Add logic to allow the app to descide whether to navigate to
      // splash screen or home page!
      home: const SplashScreen(),
    );
  }
}

final darkTheme = ThemeData(
  fontFamily: 'Helvatica',
  scaffoldBackgroundColor: appColors.surfaceGrey,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: appColors.green,
    secondary: appColors.lightGrey,
    surface: appColors.surfaceGrey,
    background: appColors.darkGrey
  ),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, 
        fontSize: 25,
      ),
    ),
);