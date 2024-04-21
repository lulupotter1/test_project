import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:global_test_project/config/app_router.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Color? bgColor;
  final Widget? bottomNavigationBar;
  final bool canPop;

  const CustomScaffold(
      {super.key, required this.body, this.appBar, this.bgColor, this.bottomNavigationBar, this.canPop = false});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (canPop) {
          AutoRouter.of(context).replace(const AuthRoute());
        }
      },
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor ?? ThemeColors.white,
        body: body,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
