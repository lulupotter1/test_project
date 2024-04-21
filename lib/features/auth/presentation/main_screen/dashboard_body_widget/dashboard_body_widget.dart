import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_test_project/core/core_bloc/core_blocs.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/dashboard_body_widget/dashboard_widget/dashboard_body_bank_widget.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/dashboard_body_widget/dashboard_widget/dashboard_body_buttons_row_widget.dart';

import 'package:global_test_project/features/auth/presentation/main_screen/dashboard_body_widget/dashboard_widget/dashboard_total_widget.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/dashboard_body_widget/dashboard_widget/dashboard_transaction_widget.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/transaction_bloc/transaction_bloc.dart';

class DashboardBodyWidget extends StatefulWidget {
  const DashboardBodyWidget({super.key});

  @override
  State<DashboardBodyWidget> createState() => _DashboardBodyWidgetState();
}

class _DashboardBodyWidgetState extends State<DashboardBodyWidget> {
  @override
  void initState() {
    CoreBlocs.transaction.add(const TransactionStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        DashboardTotalWidget(),
        SizedBox(height: 30),
        DashboardBodyButtonsRowWidget(),
        SizedBox(height: 30),
        DashboardBodyBankWidget(),
        SizedBox(height: 20),
        Expanded(child: DashboardTransactionWidget())
      ],
    );
  }
}
