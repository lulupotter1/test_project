import 'package:global_test_project/features/auth/domain/entities/transaction_entity.dart';
import 'package:global_test_project/features/auth/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetTransactionUseCase {
  final TransactionRepository _transactionRepository;

  GetTransactionUseCase(this._transactionRepository);

  Future<List<TransactionEntity>> call() {
    return _transactionRepository.getTranactionsList();
  }
}
