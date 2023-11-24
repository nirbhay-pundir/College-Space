import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_space/src/controller/button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/text_styles.dart';
import '../utils/auto_size.dart';

class CsButton extends StatelessWidget {
  CsButton({
    super.key,
    required this.colorScheme,
    required this.onClick,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  final buttonController = Get.put(ButtonController());
  final ColorScheme colorScheme;
  final dynamic onClick;
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: AutoSize.getAutoWidth(228),
            minHeight: AutoSize.getAutoHeight(45),
            maxWidth: AutoSize.getAutoWidth(228),
            maxHeight: AutoSize.getAutoHeight(45),
          ),
          child: ElevatedButton(
            onPressed: buttonController.isLoading.value
                ? null
                : () {
                    buttonController.setLoading(context, onClick);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              textStyle: CSTextStyles.signInButton,
              disabledBackgroundColor: colorScheme.secondary,
              elevation: 5,
            ),
            child: buttonController.isLoading.value
                ? SizedBox(
                    width: AutoSize.getAutoHeight(30),
                    height: AutoSize.getAutoHeight(30),
                    child: CircularProgressIndicator(
                      color: colorScheme.background,
                      strokeWidth: AutoSize.getAutoHeight(4),
                    ),
                  )
                : AutoSizeText(
                    minFontSize: 2,
                    text,
                  ),
          ),
        ),
      ),
    );
  }
}
