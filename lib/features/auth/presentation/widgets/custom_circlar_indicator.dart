import 'package:flutter/material.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';

class CustomCirclarIndicator extends StatelessWidget {
  const CustomCirclarIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ThemeColors.primaryColor,
      ),
    );
  }
}
