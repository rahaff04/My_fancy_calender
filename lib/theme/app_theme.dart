import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTheme{

  //color palete
  static const Color pastelLavender = Color(0xFFE7DCFE);
  static const Color softPurple = Color(0xFFDCC5FB);
  static const Color softLavender = Color(0xFFE6E6FA);
  static const Color pastelPink = Color(0xFFF3AEDB);
  static const Color softPink = Color(0xFFFBC4E4);
  static const Color blushPink = Color(0xFFFCE0EF);
  static const Color lightPurple = Color(0xFFDCC5FB);
  static const Color lavenderPurple = Color(0xFFC9A7EE);
  static const Color mediumPurple = Color(0xFFB58DE3);
  static const Color dustyPurple = Color(0xFFA47DCE);
  static const Color deepPurple = Color(0xFF8F6BB8);
  static const Color darkText = Color(0xFF4A3B52);
  static const Color pixelOutline = Color(0xFF5C3A68);

  static ThemeData get them {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: softLavender,
      primaryColor: lavenderPurple,

      //text theme
      textTheme: GoogleFonts.silkscreenTextTheme(
        ThemeData.light().textTheme,
      ).copyWith(
        bodyMedium: GoogleFonts.pressStart2p(
          color: darkText,
          fontSize: 12,
        ),
        bodySmall: GoogleFonts.pressStart2p(
          color: darkText,
          fontSize: 9,
        ),
        titleLarge: GoogleFonts.silkscreen(
          color: pixelOutline,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      //App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: softPurple,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: pixelOutline),
        titleTextStyle: GoogleFonts.pressStart2p(
          color: pixelOutline,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),

      //buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: mediumPurple,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Bouncy pixel edges
            side: const BorderSide(color: pixelOutline, width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: GoogleFonts.pressStart2p(fontSize: 10),
        ),
      ),

      //cards, containers
      cardTheme: CardThemeData(
        color: Colors.white.withValues(),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: pastelPink,
            width: 2,
          ),
        ),
      ),

    );
  }
}