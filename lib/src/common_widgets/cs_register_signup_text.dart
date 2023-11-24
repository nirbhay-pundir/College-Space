import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';

class CsRegisterSignUpText extends StatelessWidget {
  const CsRegisterSignUpText({
    super.key,
    required this.colorScheme,
    required this.text1,
    required this.text2,
    required this.color,
    required this.onTap,
  });

  final ColorScheme colorScheme;
  final String text1;
  final String text2;
  final Color color;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AutoSizeText.rich(
        minFontSize: 2,
        TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: CSTextStyles.bottomLine.copyWith(
                color: color,
              ),
            ),
            TextSpan(
              text: text2,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onTap();
                },
              style: CSTextStyles.bottomLine.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: color,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
