// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  // App main colors

  static Color bgColor = Color(0xFFF5EDDD);
  static Color mainColor = Color(0xFFD93659);
  static Color accentColor = Color(0xFFE76688);

  // Paper color

  static List<Color> cardsColor = [
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.indigo.shade100,
    Colors.purple.shade100,
  ];

  // Text

  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );
  static TextStyle dateTitle = GoogleFonts.roboto(
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
  );
}
