import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightThemes(BuildContext context) => ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow.shade700,
        fontFamily: GoogleFonts.lato().fontFamily,
      );
}
