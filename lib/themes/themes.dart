import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  Color green =  const Color.fromARGB(255, 8, 255, 173);
}


var lightTheme = ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 30,
            // fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          toolbarHeight: 70
        ),
        // Color theme
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: AppColors().green 
        )
);