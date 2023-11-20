import 'package:college_space/src/constants/image_paths.dart';
import 'package:college_space/src/constants/strings.dart';
import 'package:college_space/src/constants/text_styles.dart';
import 'package:college_space/src/controller/check_update_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../utils/auto_size.dart';

class CheckUpdate extends StatelessWidget {
  CheckUpdate({super.key});

  static String route = 'Check Update';
  final checkUpdateController = Get.put(CheckUpdateController());

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    checkUpdateController.startAnimation();
    AutoSize().init(context, 390, 844, 0);
    return SafeArea(

      child: Scaffold(
        body: Stack(
          children: [
            Obx(
                  () =>
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutBack,
                    left: checkUpdateController.animating.value
                        ? AutoSize.getAutoWidth(-127)
                        : AutoSize.getAutoWidth(-511.51),
                    top: checkUpdateController.animating.value
                        ? AutoSize.getAutoHeight(314)
                        : AutoSize.getAutoHeight(608.18),
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
            ),
            Obx(
                  () =>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: AutoSize.getAutoHeight(321),
                      ),
                      Hero(
                        tag: 'QImage',
                        child: Image.asset(
                          QImagePaths.updateCheckQImage,
                          height: AutoSize.getAutoHeight(204),
                          width: AutoSize.getAutoWidth(202),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(100),
                      ),
                      if (checkUpdateController.updated.value)
                        SizedBox(
                          height: AutoSize.getAutoHeight(45),
                        )
                      else
                        if (checkUpdateController.animated.value)
                          Center(
                            child: SizedBox(
                              width: AutoSize.getAutoHeight(45),
                              height: AutoSize.getAutoHeight(45),
                              child: CircularProgressIndicator(
                                strokeWidth: AutoSize.getAutoHeight(4),
                                color: colorScheme.secondary,
                              ),
                            ),
                          )
                        else
                          SizedBox(
                            height: AutoSize.getAutoHeight(45),
                          ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(20),
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        crossFadeState: checkUpdateController.updated.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: AutoSize.getAutoHeight(30),
                            maxHeight: AutoSize.getAutoHeight(30),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: AutoSizeText.rich(
                              minFontSize: 2,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: QStrings.newUser0,
                                    style: QTextStyles.bottomLine,
                                  ),
                                  TextSpan(
                                    text: QStrings.newUser1,
                                    recognizer: TapGestureRecognizer()
                                    // TODO: Implement navigation to Signup screen
                                      ..onTap = () {},
                                    style: QTextStyles.bottomLine.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: colorScheme.background,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        secondChild: Center(
                          child: SizedBox(
                            height: AutoSize.getAutoHeight(30),
                            child: AutoSizeText(
                              minFontSize: 2,
                              QStrings.checkUpdate,
                              textAlign: TextAlign.center,
                              style: QTextStyles.bottomLine,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(40),
                      ),
                    ],
                  ),
            ),
            Obx(
                  () =>
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutBack,
                    left: checkUpdateController.updated.value
                        ? AutoSize.getAutoWidth(81)
                        : AutoSize.getAutoWidth(-511.51),
                    top: AutoSize.getAutoHeight(625),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: AutoSize.getAutoWidth(228),
                          minHeight: AutoSize.getAutoHeight(45),
                          maxWidth: AutoSize.getAutoWidth(228),
                          maxHeight: AutoSize.getAutoHeight(45),
                        ),
                        child: ElevatedButton(
                          onPressed: checkUpdateController.isLoading.value
                              ? null
                              : () {
                            checkUpdateController.setLoading(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.background,
                            foregroundColor: colorScheme.primary,
                            textStyle: QTextStyles.signInButton,
                            disabledBackgroundColor: colorScheme.secondary,
                            elevation: 5,
                          ),
                          child: checkUpdateController.isLoading.value
                              ? SizedBox(
                            width: AutoSize.getAutoHeight(30),
                            height: AutoSize.getAutoHeight(30),
                            child: CircularProgressIndicator(
                              color: colorScheme.background,
                              strokeWidth: AutoSize.getAutoHeight(4),
                            ),
                          )
                              : const AutoSizeText(
                            minFontSize: 2,
                            QStrings.signIn,
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
