library app_colors;
import 'dart:ui';

export 'colors.dart';

/// MyColors class defines all the colors that will are 
/// globally used across the app

class MyColors {
  final Color green = const Color.fromARGB(255, 35, 250, 42);
  final Color surfaceGrey = const Color.fromARGB(255, 16, 16, 16);
  final Color darkGrey =  const Color.fromARGB(255, 16, 16, 16);
  final Color lightGrey = const Color.fromARGB(255, 33, 33, 33);
}

///  This instance is ment to be accessed by the rest of the app 
/// avoid having to instatiate the the MyColors app over and over again

final MyColors appColors = MyColors();