import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.deepPurple[100]!, //need '!' else gives error
    primary: Colors.deepPurple[300]!,
    secondary: Colors.deepPurple[900]!,
  ),
  // backgroundColor: Colors.grey[300],
  // primaryColor: Colors.deepPurple[100]
);
