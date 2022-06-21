import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String uri = 'http://localhost:4000/v1';

class GlobalVariables {
  // Colors
  late Color fontColor;

  static const backgroundColor = Color(0xFFF7F9F9);
  static const blackColor = Color(0xFF232B2B);
  static const primaryColor = Color(0xFF044F69);
  static const questionColor = Color(0xFF6688FF);
  static const grayColor = Color(0xFF565254);
  static const greenColor = Color(0xFF558B6E);
  static const yellowColor = Color(0xFFFFD166);

  static var h1B = GoogleFonts.quicksand(
    fontSize: 32,
    color: blackColor,
    fontWeight: FontWeight.w700,
  );
  static var h1W = GoogleFonts.quicksand(
    fontSize: 32,
    color: backgroundColor,
    fontWeight: FontWeight.w700,
  );
  static var h2W = GoogleFonts.quicksand(
    fontSize: 20,
    color: backgroundColor,
    fontWeight: FontWeight.w600,
  );
  static var h2B = GoogleFonts.quicksand(
    fontSize: 20,
    color: blackColor,
    fontWeight: FontWeight.w600,
  );
  static var h3W = GoogleFonts.quicksand(
    fontSize: 32,
    color: backgroundColor,
    fontWeight: FontWeight.w600,
  );
  static var h3B = GoogleFonts.quicksand(
    fontSize: 32,
    color: blackColor,
    fontWeight: FontWeight.w700,
  );
  static var h3Blue = GoogleFonts.quicksand(
    fontSize: 32,
    color: primaryColor,
    fontWeight: FontWeight.w700,
  );
  static var bigTextW = GoogleFonts.inter(
    fontSize: 16,
    color: backgroundColor,
    fontWeight: FontWeight.w400,
  );
  static var bigTextB = GoogleFonts.inter(
    fontSize: 16,
    color: blackColor,
    fontWeight: FontWeight.w400,
  );
  static var bodyTextG = GoogleFonts.inter(
    fontSize: 14,
    color: grayColor,
    fontWeight: FontWeight.w400,
  );
  static var bodyTextB = GoogleFonts.inter(
    fontSize: 14,
    color: blackColor,
    fontWeight: FontWeight.w400,
  );
  static var mediumTextG = GoogleFonts.inter(
    fontSize: 12,
    color: grayColor,
    fontWeight: FontWeight.w500,
  );
  static var smallTextB = GoogleFonts.inter(
    fontSize: 10,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );
}
