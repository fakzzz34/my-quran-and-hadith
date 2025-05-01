import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_theme.dart';

class Texts {
  static Widget heading(
    String text, {
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: color,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                )
              : GoogleFonts.amiri(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
    );
  }

  static Widget xl(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: fontWeight,
              color: color,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: fontWeight,
                  color: color,
                )
              : GoogleFonts.amiri(
                  fontSize: 24,
                  fontWeight: fontWeight,
                  color: color,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
    );
  }

  static Widget l(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: fontWeight,
              color: color,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: fontWeight,
                  color: color,
                )
              : GoogleFonts.amiri(
                  fontSize: 20,
                  fontWeight: fontWeight,
                  color: color,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
    );
  }

  static Widget m(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: fontWeight,
              color: color,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: fontWeight,
                  color: color,
                )
              : GoogleFonts.amiri(
                  fontSize: 16,
                  fontWeight: fontWeight,
                  color: color,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
    );
  }

  static Widget s(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: fontWeight,
              color: color,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: fontWeight,
                  color: color,
                )
              : GoogleFonts.amiri(
                  fontSize: 14,
                  fontWeight: fontWeight,
                  color: color,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
    );
  }

  static Widget xs(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: fontWeight,
              color: color,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: fontWeight,
                  color: color,
                )
              : GoogleFonts.amiri(
                  fontSize: 12,
                  fontWeight: fontWeight,
                  color: color,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
    );
  }
}

enum FontStyles {
  montserrat,
  poppins,
  amiri,
}


// heading = 30
// xl = 24
// l = 20
// m = 16
// s = 14
// xs = 12