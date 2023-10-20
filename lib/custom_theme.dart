import 'package:flutter/material.dart';

class CustomTheme {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xFF171B34);
  static const Color lightGreyColor = Color(0xFFF0F0F0);
  static const Color fontGreyColor = Color(0xFFbdbdbd);
  static const Color greyColor = Color(0xFF525252);
  static const Color darkGreyColor = Color(0xFF434343);

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xFFFFDE01),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: blackColor,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: blackColor,
          ),
          titleLarge: TextStyle(
            fontSize: 13,
            color: fontGreyColor,
          ),
          titleMedium: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: fontGreyColor,
          ),
          titleSmall: TextStyle(
            fontSize: 10,
            color: fontGreyColor,
          ),
          labelSmall: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
        ),
      );
}
