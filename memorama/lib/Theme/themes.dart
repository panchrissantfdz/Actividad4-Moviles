import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Color(0xFF800020), // Guinda
    tertiary: Color(0xFF5C0015),  // Versión más oscura del guinda
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF800020),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF800020),
  ),
);


final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.indigo,
    secondary: Color(0xFF5C0015), // Guinda oscuro
    tertiary: Color(0xFF800020),  // Guinda más claro (para contraste o resalte)
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF5C0015),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF5C0015),
  ),
);
