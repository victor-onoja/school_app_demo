import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF0D47A1), // Primary color for the app
    hintColor: const Color(0xFF1976D2), // Background color

    // Define the default font family
    fontFamily: 'Roboto',

    // Define the default text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
    ),

    // Define the default button theme
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFF0D47A1), // Button color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      textTheme: ButtonTextTheme.primary, // Text color inside buttons
    ),

    // Define the default input decoration theme (for text fields)
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0D47A1)),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(surface: const Color(0xFFF5F5F5)),
  );
}
