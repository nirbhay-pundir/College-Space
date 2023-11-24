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
import 'dashboard.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  static String route = 'Sign In';
  final formKey = GlobalKey<FormState>();
  final checkUpdateController = Get.put(CheckUpdateController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    AutoSize().init(context, 390, 844, 0);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Dashboard();
        } else {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Stack(
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
                            SizedBox(
                              height: AutoSize.getAutoHeight(46.7),
                            ),
                            Hero(
                              tag: 'CSImage',
                              child: Image.asset(
                                CSImagePaths.updateCheckCSImage,
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
                              child: Hero(
                                tag: 'Heading',
                                child: Material(
                                  child: Text(
                                    CSStrings.signIn,
                                    textAlign: TextAlign.center,
                                    style: CSTextStyles.heading,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AutoSize.getAutoHeight(15),
                            ),
                            CsInputField(
                              controller: emailController,
                              colorScheme: colorScheme,
                              text: CSStrings.emailInput,
                              hintText: CSStrings.emailInputHint,
                              icon: Icons.email,
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: AutoSize.getAutoHeight(15),
                            ),
                            CsInputField(
                              controller: passwordController,
                              colorScheme: colorScheme,
                              text: CSStrings.passInput,
                              hintText: CSStrings.passInputHint,
                              icon: Icons.email,
                              type: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: AutoSize.getAutoHeight(50),
                            ),
                            Hero(
                              tag: "Button",
                              child: CsButton(
                                colorScheme: colorScheme,
                                text: CSStrings.signIn,
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.background,
                                onClick: () => {
                                  FirebaseAuthServices.SignIn(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  ),
                                },
                              ),
                            ),
                            SizedBox(
                              height: AutoSize.getAutoHeight(10),
                            ),
                            CsRegisterSignUpText(
                              colorScheme: colorScheme,
                              color: colorScheme.primary,
                              onTap: () => {
                                Navigator.pushNamed(
                                    context, SignUpPersonal.route)
                              },
                              text1: CSStrings.newUser0,
                              text2: CSStrings.newUser1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: AutoSize.getAutoHeight(5),
                      left: AutoSize.getAutoWidth(5),
                      child: Hero(
                        tag: 'Back Button',
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
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
