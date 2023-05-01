import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nba_stats_app/views/screens/splash_screen.dart';
import 'package:nba_stats_app/views/widgets/bottom_nav_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 16, 16, 16),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      darkTheme: ThemeData(
        fontFamily: 'Helvatica',
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 16, 16),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color.fromARGB(255, 35, 250, 42),
          secondary: const Color.fromARGB(255, 71, 71, 71),
          surface: const Color.fromARGB(255, 16, 16, 16),
          background: const Color.fromARGB(255, 16, 16, 16),
        ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            centerTitle: true,
            elevation: 0
          ),
      ),
      title: "Nba Stats",
    );
  }
}
