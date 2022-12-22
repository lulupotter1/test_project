import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:test_project/utils/theme_colors.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final PreferredSizeWidget? appBar;
  const CommonScaffold({
    Key? key,
    this.backgroundColor = ThemeColors.black,
    this.appBar,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
