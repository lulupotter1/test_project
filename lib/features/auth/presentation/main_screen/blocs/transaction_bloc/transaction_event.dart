part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionStartEvent extends TransactionEvent {
  const TransactionStartEvent();

  @override
  List<Object> get props => [];
}
