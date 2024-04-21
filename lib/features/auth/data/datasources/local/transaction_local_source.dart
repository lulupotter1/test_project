import 'package:global_test_project/core/constant/constants.dart';
import 'package:global_test_project/features/auth/data/models/transaction_model.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';

abstract class TransactionLocalSource {
  Future<List<TransactionModel>> getTranactionsList();
}

@Injectable(as: TransactionLocalSource)
class TransactionLocalSourceIml implements TransactionLocalSource {
  @override
  Future<List<TransactionModel>> getTranactionsList() async {
    const String apiMessage = Constants.apiMessage;

    Map<String, dynamic> result = json.decode(apiMessage);

    List<TransactionModel> transactionList = [];

    for (var transaction in result["result"] ?? []) {
      transactionList.add(TransactionModel.fromJson(transaction));
    }

    return transactionList;
  }
}
