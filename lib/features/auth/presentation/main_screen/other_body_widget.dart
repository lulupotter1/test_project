import 'package:flutter/material.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';

class OtherBodyWidget extends StatelessWidget {
  final String text;
  const OtherBodyWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: ThemeTextBrandonGrotesqueBold.commonSize,
      ),
    );
  }
}
