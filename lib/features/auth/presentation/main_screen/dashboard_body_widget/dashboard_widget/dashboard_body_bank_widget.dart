import 'package:flutter/material.dart';

class DashboardBodyBankWidget extends StatelessWidget {
  const DashboardBodyBankWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/bank_container.png",
      width: double.maxFinite,
      height: 121,
    );
  }
}
