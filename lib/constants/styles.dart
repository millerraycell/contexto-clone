import 'package:contexto/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  // spacement
  static const EdgeInsets padding = EdgeInsets.all(16.0);
  static const EdgeInsets rightText = EdgeInsets.only(right: 8.0);
  static const EdgeInsets verticalPadding = EdgeInsets.only(bottom: 10.0);

  static const double wrapSpacingElements = 30.0;
  static const double wrapSpacingLines = 8.0;

  // border radius
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(10.0));

  // text style
  static TextStyle title = GoogleFonts.nunito(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    color: ContextoColors.defaultTextColor,
  );

  static TextStyle subtitle = GoogleFonts.nunito(
    fontSize: 22.0,
    fontWeight: FontWeight.w900,
    color: ContextoColors.defaultTextColor,
  );

  static TextStyle howToPlayText = GoogleFonts.nunito(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: ContextoColors.defaultTextColor,
  );

  static TextStyle gameStatsDescription = GoogleFonts.nunito(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: ContextoColors.defaultTextColor,
  ); 
  
   static TextStyle faqDescription = GoogleFonts.nunito(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: ContextoColors.defaultTextColor,
  );

  static TextStyle gameStats = GoogleFonts.nunito(
    fontSize: 22.0,
    fontWeight: FontWeight.w900,
    color: ContextoColors.defaultTextColor,
  );
}
