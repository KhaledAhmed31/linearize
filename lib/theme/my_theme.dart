import 'package:flutter/material.dart';
import 'package:linearize/theme/my_colors.dart';

class MyTheme {
  //Light Theme
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: MyColors.background,
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.background),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 100,
        backgroundColor: Color(0xff6658c7),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: MyColors.buttoms,
              fontSize: 26,
              fontWeight: FontWeight.bold),
          titleMedium: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          )));

  //Dark Themef
  static ThemeData darkTheme = ThemeData();
}
