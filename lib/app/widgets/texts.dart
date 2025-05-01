import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_theme.dart';

class Texts {
  static Widget heading(
    String text, {
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
    double? height,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: color,
              height: height,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                  height: height,
                )
              : GoogleFonts.amiri(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                  height: height,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  static Widget xl(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
    double? height,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: fontWeight,
              color: color,
              height: height,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                )
              : GoogleFonts.amiri(
                  fontSize: 24,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  static Widget l(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
    double? height,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: fontWeight,
              color: color,
              height: height,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                )
              : GoogleFonts.amiri(
                  fontSize: 20,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  static Widget m(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
    double? height,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: fontWeight,
              color: color,
              height: height,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                )
              : GoogleFonts.amiri(
                  fontSize: 16,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  static Widget s(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
    double? height,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: fontWeight,
              color: color,
              height: height,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                )
              : GoogleFonts.amiri(
                  fontSize: 14,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }

  static Widget xs(
    String text, {
    FontWeight fontWeight = FontWeight.normal,
    FontStyles fontStyle = FontStyles.montserrat,
    Color color = neutralMain,
    TextAlign? textAlign,
    double? height,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
  }) {
    return Text(
      text,
      style: fontStyle == FontStyles.montserrat
          ? GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: fontWeight,
              color: color,
              height: height,
            )
          : fontStyle == FontStyles.poppins
              ? GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                )
              : GoogleFonts.amiri(
                  fontSize: 12,
                  fontWeight: fontWeight,
                  color: color,
                  height: height,
                ),
      textDirection:
          fontStyle == FontStyles.amiri ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
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