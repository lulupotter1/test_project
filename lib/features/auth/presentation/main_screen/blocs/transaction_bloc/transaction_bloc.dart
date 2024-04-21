import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:global_test_project/features/auth/domain/entities/transaction_entity.dart';
import 'package:global_test_project/features/auth/domain/usecases/get_transcation.dart';
import 'package:injectable/injectable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

@Injectable()
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionUseCase getTransactionUseCase;
  TransactionBloc(
    this.getTransactionUseCase,
  ) : super(TransactionInitial()) {
    on<TransactionStartEvent>(_onTransactionStartEventx);
  }

  _onTransactionStartEventx(TransactionStartEvent event, Emitter<TransactionState> emit) async {
    try {
      emit(TransactionLoading());

      List<TransactionEntity> transactionList = [];
      transactionList.addAll(await getTransactionUseCase.call());

      emit(TransactionLoaded(transactionList: transactionList));
    } catch (e) {}
  }
}
