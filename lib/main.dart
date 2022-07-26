import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'consts/constants.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: pageBackgroundColor,
        fontFamily: "OverpassMono",
      ),
      home: const HomePage(title: appTitle),
    );
  }
}
