// lib/theme_data.dart

import 'package:flutter/material.dart';

// --- Shared Colors ---
const Color primaryColor = Color(0xFF00ADB5); // Teal/Aqua accent
const Color secondaryColor = Color(0xFF393E46); // Dark Gray for elements

// --- Light Theme Colors ---
const Color lightBackground = Color(0xFFEEEEEE);
const Color lightText = Color(0xFF222831);

// --- Dark Theme Colors ---
const Color darkBackground = Color(0xFF222831);
const Color darkText = Color(0xFFEEEEEE);

// --- Light Theme Data ---
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: lightBackground,
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    foregroundColor: lightText,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: lightText),
    bodyMedium: TextStyle(color: lightText),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(primaryColor),
    trackColor: MaterialStateProperty.all(secondaryColor.withOpacity(0.5)),
  ),
);

// --- Dark Theme Data ---
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: darkBackground,
  appBarTheme: const AppBarTheme(
    color: secondaryColor,
    foregroundColor: darkText,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: darkText),
    bodyMedium: TextStyle(color: darkText),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(primaryColor),
    trackColor: MaterialStateProperty.all(lightText.withOpacity(0.5)),
  ),
);