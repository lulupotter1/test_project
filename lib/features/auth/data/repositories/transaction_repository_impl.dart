import 'package:global_test_project/features/auth/data/datasources/local/transaction_local_source.dart';
import 'package:global_test_project/features/auth/domain/entities/transaction_entity.dart';
import 'package:global_test_project/features/auth/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalSource _transactionLocalSource;

  TransactionRepositoryImpl(this._transactionLocalSource);
  @override
  Future<List<TransactionEntity>> getTranactionsList() async {
    List<TransactionEntity> transactionList = [];

    final result = await _transactionLocalSource.getTranactionsList();

    for (var transaction in result) {
      transactionList.add(transaction.mapToEntity());
    }

    return transactionList;
  }
}
