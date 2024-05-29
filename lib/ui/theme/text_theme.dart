import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final monospace = GoogleFonts.jetBrainsMono();

final textTheme = GoogleFonts.interTextTheme(
  const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 96),
    displayMedium: TextStyle(fontWeight: FontWeight.w800, fontSize: 64),
    displaySmall: TextStyle(fontWeight: FontWeight.w900, fontSize: 48),
    headlineLarge: TextStyle(fontWeight: FontWeight.w800),
    headlineMedium: TextStyle(fontWeight: FontWeight.w800),
    headlineSmall: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
    titleLarge: TextStyle(fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontWeight: FontWeight.w700),
    titleSmall: TextStyle(fontWeight: FontWeight.w700),
    bodyLarge: TextStyle(fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontWeight: FontWeight.w600),
    bodySmall: TextStyle(fontWeight: FontWeight.w600),
    labelLarge: TextStyle(fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontWeight: FontWeight.w600),
    labelSmall: TextStyle(fontWeight: FontWeight.w600),
  ),
);