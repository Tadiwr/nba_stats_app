import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/themes/colors.dart';
import 'package:nba_stats_app/views/widgets/first_launch_dec.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      systemNavigationBarColor: appColors.surfaceGrey,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light
  ));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<SharedPreferences> getPrefsInstance() async {
    return SharedPreferences.getInstance(); 
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Nba Stats",
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const FirstLaunchDectection()
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