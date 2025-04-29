import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import '../core/theme/app_theme.dart';

class SubtitleMarquee extends StatelessWidget {
  final String? revelation;
  final String? translation;
  final int? verseCount;

  const SubtitleMarquee({
    super.key,
    required this.revelation,
    required this.translation,
    required this.verseCount,
  });

  @override
  Widget build(BuildContext context) {
    final fullText = '$revelation   •   $translation ($verseCount)';

    final textStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: neutralSecondary,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Measure the rendered width of the text
        final textPainter = TextPainter(
          text: TextSpan(text: fullText, style: textStyle),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: double.infinity);

        final textWidth = textPainter.size.width;
        final availableWidth = constraints.maxWidth;

        if (textWidth > availableWidth) {
          // Overflow: show marquee
          return SizedBox(
            height: 20,
            child: Marquee(
              text: fullText,
              style: textStyle,
              scrollAxis: Axis.horizontal,
              blankSpace: 40.0,
              velocity: 30.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          );
        } else {
          // Fits: show static text
          return Text(
            fullText,
            style: textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        }
      },
    );
  }
}
