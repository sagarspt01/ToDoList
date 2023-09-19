import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_to_do/pages/homepage.dart';
import 'package:task_to_do/theme/darktheme.dart';
import 'package:task_to_do/theme/light_theme.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox("mybox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
