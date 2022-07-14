import 'package:flutter/material.dart';

// Color
Color kBlueColor = const Color(0xFF1e698d);
Color kRedColor = const Color(0xFFFF3A44);
Color kYellowColor = const Color(0xFFFFE600);
Color kOrangeColor = const Color(0xFFf8b92e);
Color kBlackColor = const Color(0xFF000000);
Color kWhiteColor = const Color(0xFFFFFFFF);
Color kDarkGreyColor = const Color(0xFF252525);
Color kLightGreyColor = const Color(0xFF3B3B3B);

// Margin
double defaultMargin = 15;

TextStyle h2TextStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w800,
  fontFamily: 'New York Small',
);
TextStyle h3TextStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'New York Small',
);
TextStyle h4TextStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'New York Small',
);
TextStyle body1TextStyle = const TextStyle(
  fontSize: 16,
  fontFamily: 'Nunito',
);
TextStyle body2TextStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'Nunito',
);

TextStyle body3TextStyle = const TextStyle(
  fontSize: 14,
  fontFamily: 'Nunito',
);
TextStyle body4TextStyle = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  fontFamily: 'Nunito',
);

TextStyle body5TextStyle = const TextStyle(
  fontSize: 11,
  fontFamily: 'Nunito',
);
TextStyle body6TextStyle = const TextStyle(
  fontSize: 10,
  fontFamily: 'Nunito',
);

ThemeData dark = ThemeData(
  appBarTheme: AppBarTheme(
    color: kDarkGreyColor,
    elevation: 0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kLightGreyColor,
    foregroundColor: kWhiteColor,
    iconSize: 40,
    sizeConstraints: const BoxConstraints(
      minHeight: 75,
      minWidth: 75,
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(),
  scaffoldBackgroundColor: kDarkGreyColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData light = ThemeData(
  appBarTheme: AppBarTheme(
    foregroundColor: kDarkGreyColor,
    color: kWhiteColor,
    elevation: 0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kWhiteColor,
    foregroundColor: kDarkGreyColor,
    iconSize: 40,
    sizeConstraints: const BoxConstraints(
      minHeight: 75,
      minWidth: 75,
    ),
  ),
  colorScheme: const ColorScheme.light().copyWith(),
  scaffoldBackgroundColor: kWhiteColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
