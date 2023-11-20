import 'dart:math';

import 'package:college_space/src/constants/strings.dart';
import 'package:college_space/src/constants/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/image_paths.dart';
import '../controller/check_update_controller.dart';
import '../utils/auto_size.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  static String route = 'Sign In';
  final checkUpdateController = Get.put(CheckUpdateController());

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    AutoSize().init(context, 390, 844, 0);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: AutoSize.getAutoWidth(-43),
              top: AutoSize.getAutoHeight(-479),
              child: Hero(
                tag: 'oval',
                child: Container(
                  width: AutoSize.getAutoWidth(517.14),
                  height: AutoSize.getAutoHeight(698.85),
                  decoration: ShapeDecoration(
                    color: colorScheme.primary,
                    shape: const OvalBorder(),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: AutoSize.getAutoHeight(46.7),
                ),
                Hero(
                  tag: 'QImage',
                  child: Image.asset(
                    QImagePaths.updateCheckQImage,
                    height: AutoSize.getAutoHeight(162),
                    width: AutoSize.getAutoWidth(161),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: AutoSize.getAutoHeight(39.17),
                ),
                SizedBox(
                  height: AutoSize.getAutoHeight(58),
                  child: AutoSizeText(
                    minFontSize: 10,
                    QStrings.signIn,
                    textAlign: TextAlign.center,
                    style: QTextStyles.heading,
                  ),
                ),
              ],
            ),
            Positioned(
              top: AutoSize.getAutoHeight(5),
              left: AutoSize.getAutoWidth(5),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: colorScheme.background,
                  size: AutoSize.getAutoHeight(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
