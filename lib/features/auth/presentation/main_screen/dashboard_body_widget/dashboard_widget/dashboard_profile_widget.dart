import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';

class DashboardProfileWidget extends StatelessWidget {
  const DashboardProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/profile_image.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Jane,",
                style: ThemeTextAvenirRegular.commonSize.copyWith(
                  fontSize: 10,
                  letterSpacing: -0.33,
                  color: ThemeColors.blackGray,
                ),
              ),
              Text(
                "Hello Jane,",
                style: ThemeTextAvenirBold.commonSize.copyWith(
                  fontSize: 16,
                  letterSpacing: -0.33,
                  color: ThemeColors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(
          "assets/icons/notification.svg",
          height: 24,
          width: 24,
          colorFilter: const ColorFilter.mode(ThemeColors.black, BlendMode.srcIn),
        ),
      ],
    );
  }
}
