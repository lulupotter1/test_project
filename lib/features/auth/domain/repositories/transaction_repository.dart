import 'package:global_test_project/features/auth/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTranactionsList();
}
