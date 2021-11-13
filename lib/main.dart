import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        backgroundColor: Color(0xFF2D046E),
        fontFamily: "IBM",
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 20,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
