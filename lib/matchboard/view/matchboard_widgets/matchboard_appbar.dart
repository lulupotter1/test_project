import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/theme_colors.dart';

class MatchboardAppBar extends StatelessWidget with PreferredSizeWidget {
  const MatchboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: AppBar(
          backgroundColor: ThemeColors.gray2,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SvgPicture.asset(
            "assets/icons/ball.svg",
            width: 47.w,
            height: 47.h,
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
