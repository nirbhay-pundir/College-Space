import 'package:college_space/src/common_widgets/cs_button.dart';
import 'package:college_space/src/constants/strings.dart';
import 'package:college_space/src/constants/text_styles.dart';
import 'package:college_space/src/screens/sign_in.dart';
import 'package:college_space/src/screens/sign_up_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/cs_dropdown_field.dart';
import '../common_widgets/cs_input_field.dart';
import '../common_widgets/cs_register_signup_text.dart';
import '../constants/image_paths.dart';
import '../controller/check_update_controller.dart';
import '../utils/auto_size.dart';

class SignUpPersonal extends StatelessWidget {
  SignUpPersonal({super.key});

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final formKey = GlobalKey<FormState>();
  static String route = 'Sign Up Personal';
  final checkUpdateController = Get.put(CheckUpdateController());

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
                left: AutoSize.getAutoWidth(-64),
                top: AutoSize.getAutoHeight(-547),
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
                        height: AutoSize.getAutoHeight(29.7),
                      ),
                      Hero(
                        tag: 'CSImage',
                        child: Image.asset(
                          CSImagePaths.updateCheckCSImage,
                          height: AutoSize.getAutoHeight(117),
                          width: AutoSize.getAutoWidth(117),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(58),
                        child: Hero(
                          tag: 'Heading',
                          child: Material(
                            child: Text(
                              CSStrings.register,
                              textAlign: TextAlign.center,
                              style: CSTextStyles.heading,
                            ),
                          ),
                        ),
                      ),
                      CsInputField(
                        colorScheme: colorScheme,
                        text: CSStrings.nameInput,
                        hintText: CSStrings.nameInputHint,
                        icon: Icons.person,
                        type: TextInputType.name,
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(15),
                      ),
                      CsDropdownField(
                        options: genderOptions,
                        colorScheme: colorScheme,
                        text: CSStrings.gender,
                        icon: Icons.male,
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(15),
                      ),
                      CsInputField(
                        colorScheme: colorScheme,
                        text: CSStrings.sapInput,
                        hintText: CSStrings.sapInputHint,
                        icon: Icons.numbers,
                        type: TextInputType.number,
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(15),
                      ),
                      CsInputField(
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
                      CsButton(
                        colorScheme: colorScheme,
                        text: CSStrings.nextButton,
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.surface,
                        onClick: () => {
                          Navigator.pushNamed(
                            context,
                            SignUpCourse.route,
                          )
                        },
                      ),
                      SizedBox(
                        height: AutoSize.getAutoHeight(10),
                      ),
                      Hero(
                        tag: "Button",
                        child: CsRegisterSignUpText(
                          colorScheme: colorScheme,
                          color: colorScheme.primary,
                          onTap: () =>
                              {Navigator.pushNamed(context, SignIn.route)},
                          text1: CSStrings.oldUser0,
                          text2: CSStrings.oldUser1,
                        ),
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
                      color: colorScheme.surface,
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
}
