import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/theme/app_theme.dart';
import 'texts.dart';

class ButtonWithArrow extends StatelessWidget {
  const ButtonWithArrow({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonWithArrowSize = ButtonWithArrowSize.medium,
  });

  final VoidCallback onPressed;
  final String text;
  final ButtonWithArrowSize buttonWithArrowSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: buttonWithArrowSize == ButtonWithArrowSize.large
            ? const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              )
            : buttonWithArrowSize == ButtonWithArrowSize.medium
                ? const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  )
                : const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: neutralContainer,
        ),
        child: IntrinsicWidth(
          child: Row(
            children: [
              buttonWithArrowSize == ButtonWithArrowSize.large
                  ? Texts.m(text)
                  : buttonWithArrowSize == ButtonWithArrowSize.medium
                      ? Texts.s(text)
                      : Texts.xs(text),
              const SizedBox(width: 11),
              SvgPicture.asset('assets/images/button_arrow.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonWithArrowSize {
  large,
  medium,
  small,
}
