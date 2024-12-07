import 'package:flutter/material.dart';


Color primarycolor=  const Color.fromARGB(255, 127, 68, 255); 
Color secondrycolor=Colors.lightBlueAccent;

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}