import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';

class DashboardTotalWidget extends StatefulWidget {
  const DashboardTotalWidget({super.key});

  @override
  State<DashboardTotalWidget> createState() => _DashboardTotalWidgetState();
}

class _DashboardTotalWidgetState extends State<DashboardTotalWidget> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ThemeColors.primaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Balance",
                style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                  fontSize: 15,
                  color: ThemeColors.white,
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    show = !show;
                  });
                },
                child: SvgPicture.asset(
                  "assets/icons/eye.svg",
                  height: 16,
                  width: 16,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Opacity(
            opacity: show ? 1 : 0,
            child: Text(
              "\$1,250,250.00",
              style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: ThemeColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
