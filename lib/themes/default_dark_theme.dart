import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:nba_stats_app/themes/colors.dart';

final darkTheme = ThemeData(
  fontFamily: 'Helvetica',
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