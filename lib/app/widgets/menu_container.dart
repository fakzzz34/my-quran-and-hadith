// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_theme.dart';

class MenuContainer extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final String asset;
  final Color backgroundColor;
  final Color containerColor;

  const MenuContainer({
    Key? key,
    required this.name,
    required this.onTap,
    required this.asset,
    required this.backgroundColor,
    required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: containerColor,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/images/bg_container.svg',
                  colorFilter: ColorFilter.mode(
                    backgroundColor,
                    BlendMode.srcIn,
                  ),
                  width: 284.59,
                  height: 111.99,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryMain,
                      ),
                    ),
                    const SizedBox(height: 44),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(asset),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
