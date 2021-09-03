import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Music App',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
          color: Colors.white,
          elevation: 4,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
