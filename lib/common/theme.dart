import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xff614A5E),
      selectionHandleColor: const Color(0xff614A5E),
      selectionColor: const Color(0xff614A5E).withOpacity(0.25),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xff614A5E), // button text color
      ),
    ),
    fontFamily: 'Varela',
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blue,
        fontSize: 20,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w800,
        color: Color(0xff0C0C0C),
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xff2C2B2B),
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xff363535),
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xff484747),
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xff484747),
        fontSize: 12,
      ),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xff484747),
          fontSize: 10,
          overflow: TextOverflow.ellipsis),
    ),
  );
}
