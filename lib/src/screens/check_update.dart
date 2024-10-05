import 'package:college_space/src/constants/image_paths.dart';
import 'package:college_space/src/constants/strings.dart';
import 'package:college_space/src/constants/text_styles.dart';
import 'package:college_space/src/controller/check_update_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_space/src/screens/dashboard.dart';
import 'package:college_space/src/screens/sign_in.dart';
import 'package:college_space/src/screens/sign_up_personal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../common_widgets/cs_button.dart';
import '../common_widgets/cs_register_signup_text.dart';
import '../utils/auto_size.dart';

class CheckUpdate extends StatelessWidget {
  CheckUpdate({super.key});

  static String route = 'Check Update';
  final checkUpdateController = Get.put(CheckUpdateController());

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    checkUpdateController.startAnimation(context);
    AutoSize().init(context, 390, 844, 0);
    return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Dashboard();
      } else {
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
                            tag: 'CSImage',
                            child: Image.asset(
                              CSImagePaths.updateCheckCSImage,
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
                              child: CsRegisterSignUpText(
                                colorScheme: colorScheme,
                                color: colorScheme.surface,
                                onTap: () =>
                                {
                                  Navigator.pushNamed(
                                      context, SignUpPersonal.route)
                                },
                                text1: CSStrings.newUser0,
                                text2: CSStrings.newUser1,
                              ),
                            ),
                            secondChild: Center(
                              child: SizedBox(
                                height: AutoSize.getAutoHeight(30),
                                child: AutoSizeText(
                                  minFontSize: 2,
                                  CSStrings.checkUpdate,
                                  textAlign: TextAlign.center,
                                  style: CSTextStyles.bottomLine,
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
                        child: Hero(
                          tag: "Button",
                          child: CsButton(
                            colorScheme: colorScheme,
                            text: CSStrings.signIn,
                            backgroundColor: colorScheme.surface,
                            foregroundColor: colorScheme.primary,
                            onClick: () =>
                            {
                              Navigator.pushNamed(
                                context,
                                SignIn.route,
                              )
                            },
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
