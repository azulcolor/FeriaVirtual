import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String uri = 'https://app-feria-virtual.herokuapp.com/v1';
String urlHost = 'app-feria-virtual.herokuapp.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const List<String> kindOf = ['Mostrar ambas', 'Privada', 'Publica'];
  static const List<String> area = [
    'Mostrar todas',
    'Arquitectura',
    'Ciencias de la salud',
    'Comercio',
    'Contabilidad',
    'Derecho',
    'Diseño gráfico',
    'Economía',
    'Educación',
    'Finanzas',
    'Gestión',
    'Gastronomía',
    'Humanidades',
    'Idiomas',
    'Ingeniería',
    'Logística',
    'Negocios',
    'Psicología',
    'Turismo',
  ];

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
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
    fontSize: 16,
    color: backgroundColor,
    fontWeight: FontWeight.w600,
  );
  static var h3B = GoogleFonts.quicksand(
    fontSize: 16,
    color: blackColor,
    fontWeight: FontWeight.w700,
  );
  static var h3Blue = GoogleFonts.quicksand(
    fontSize: 16,
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

  static var mediumTextGreen = GoogleFonts.inter(
    fontSize: 12,
    color: greenColor,
    fontWeight: FontWeight.w500,
  );
  static var mediumTextRed = GoogleFonts.inter(
    fontSize: 12,
    color: Color.fromARGB(255, 180, 62, 54),
    fontWeight: FontWeight.w500,
  );
  static var mediumTextBlue = GoogleFonts.inter(
    fontSize: 12,
    color: questionColor,
    fontWeight: FontWeight.w500,
  );
  static var mediumTextYellow = GoogleFonts.inter(
    fontSize: 12,
    color: secondaryColor,
    fontWeight: FontWeight.w500,
  );
  static var smallTextG = GoogleFonts.inter(
    fontSize: 10,
    color: grayColor,
    fontWeight: FontWeight.w500,
  );

  static var smallTextW = GoogleFonts.inter(
    fontSize: 10,
    color: backgroundColor,
    fontWeight: FontWeight.w500,
  );
  static var smallTextW2 = GoogleFonts.inter(
    fontSize: 16,
    color: backgroundColor,
    fontWeight: FontWeight.w500,
  );
}
