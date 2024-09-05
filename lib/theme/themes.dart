import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.montaga().fontFamily,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.deepPurple.shade500,
    secondary: Colors.grey.shade900,
  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.montaga().fontFamily,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.deepPurple.shade500,
    secondary: Colors.grey.shade300,
  ),
);
