import 'package:flutter/material.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';

class CustomTextButton extends StatelessWidget {
  final String btnText;
  final Function() onTap;
  const CustomTextButton({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
        backgroundColor: MaterialStateProperty.all(ThemeColors.primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        btnText,
        style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
          color: ThemeColors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
