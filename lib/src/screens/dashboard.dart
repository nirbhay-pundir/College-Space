import 'package:college_space/src/constants/strings.dart';
import 'package:college_space/src/constants/text_styles.dart';
import 'package:college_space/src/screens/sign_up_personal.dart';
import 'package:college_space/src/utils/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/cs_button.dart';
import '../common_widgets/cs_input_field.dart';
import '../common_widgets/cs_register_signup_text.dart';
import '../constants/image_paths.dart';
import '../controller/check_update_controller.dart';
import '../utils/auto_size.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  static String route = 'Dashboard';
  final formKey = GlobalKey<FormState>();
  final checkUpdateController = Get.put(CheckUpdateController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    AutoSize().init(context, 390, 844, 0);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                left: AutoSize.getAutoWidth(36),
                top: AutoSize.getAutoHeight(36),
                child: Hero(
                  tag: 'oval',
                  child: Container(
                    width: AutoSize.getAutoWidth(74),
                    height: AutoSize.getAutoHeight(74),
                    decoration: ShapeDecoration(
                      color: colorScheme.primary,
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          top: 43,
                        ),
                        child: Row(
                          children: [
                            Hero(
                              tag: 'CSImage',
                              child: Image.asset(
                                CSImagePaths.updateCheckCSImage,
                                height: AutoSize.getAutoHeight(60),
                                width: AutoSize.getAutoWidth(60),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(15),
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(58),
                        child: Hero(
                          tag: 'Heading',
                          child: Material(
                            child: Text(
                              CSStrings.dashboard,
                              textAlign: TextAlign.center,
                              style: CSTextStyles.heading,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(50),
                      ),
                      Hero(
                        tag: "Button",
                        child: CsButton(
                          colorScheme: colorScheme,
                          text: CSStrings.signOut,
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.surface,
                          onClick: () => {
                            FirebaseAuth.instance.signOut(),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
