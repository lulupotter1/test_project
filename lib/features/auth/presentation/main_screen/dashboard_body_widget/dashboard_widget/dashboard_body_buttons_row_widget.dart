import 'package:flutter/material.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';

class DashboardBodyButtonsRowWidget extends StatelessWidget {
  const DashboardBodyButtonsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _column(
            asset: "assets/images/save.png",
            text: "Quick save",
          ),
          _column(
            asset: "assets/images/pay_bills.png",
            text: "Pay bills",
          ),
          _column(
            asset: "assets/images/loan.png",
            text: "Loan",
          ),
        ],
      ),
    );
  }

  Widget _column({
    required String text,
    required String asset,
  }) {
    return Column(
      children: [
        Image.asset(
          asset,
          width: 51,
          height: 51,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: ThemeTextBrandonGrotesqueRegular.commonSize,
        )
      ],
    );
  }
}
