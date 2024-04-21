import 'package:flutter/material.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final String? Function(String?)? validator;
  final String label;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.validator,
    this.isObscure = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: ThemeTextBrandonGrotesqueBold.commonSize,
        ),
        const SizedBox(height: 5),
        TextFormField(
          style: ThemeTextBrandonGrotesqueBold.commonSize,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: isObscure,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            suffix: widget.isObscure
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Text(
                      "show",
                      style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                        color: ThemeColors.showGray,
                        fontSize: 14,
                      ),
                    ),
                  )
                : null,
            isDense: true,
            hintText: widget.hintText,
            filled: true,
            fillColor: ThemeColors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            hintStyle: ThemeTextBrandonGrotesqueRegular.commonSize,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ThemeColors.errorColor,
                width: 0.88,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ThemeColors.borderPurple,
                width: 0.88,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ThemeColors.errorColor,
                width: 0.88,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ThemeColors.borderGray,
                width: 0.88,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
