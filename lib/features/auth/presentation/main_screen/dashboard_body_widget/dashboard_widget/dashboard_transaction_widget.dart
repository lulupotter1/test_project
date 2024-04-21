import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';
import 'package:global_test_project/features/auth/domain/entities/transaction_entity.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/transaction_bloc/transaction_bloc.dart';

class DashboardTransactionWidget extends StatelessWidget {
  const DashboardTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        List<TransactionEntity> transactionList = [];
        if (state is TransactionLoaded) {
          transactionList = state.transactionList;
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                    fontSize: 16,
                    color: ThemeColors.gray2,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                      fontSize: 16,
                      color: ThemeColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  "Today",
                  style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 2),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => TransactionWidget(
                transactionData: transactionList[index],
              ),
              itemCount: transactionList.length,
            )),
          ],
        );
      },
    );
  }
}

class TransactionWidget extends StatelessWidget {
  final TransactionEntity transactionData;
  const TransactionWidget({
    super.key,
    required this.transactionData,
  });

  @override
  Widget build(BuildContext context) {
    bool isUp = transactionData.isUp ?? false;
    String price = "\$${transactionData.amount}";
    if (!isUp) {
      price = "-$price";
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: ThemeColors.white,
        border: Border(
          bottom: BorderSide(width: 0.7, color: ThemeColors.inactive),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            isUp ? "assets/images/up.png" : "assets/images/down.png",
            height: 42,
            width: 42,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionData.name ?? "-",
                  style: ThemeTextBrandonGrotesqueRegular.commonSize,
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  "7080901123",
                  style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(fontSize: 10, color: ThemeColors.brown),
                ),
                const SizedBox(height: 2),
                Text(
                  "22-06-2022   10 : 02 : 43 AM",
                  style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(fontSize: 8, color: ThemeColors.gray3),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            price,
            style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
