import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String? name;
  final String? amount;
  final bool? isUp;
  final String? comment;

  const TransactionEntity({
    this.name,
    this.amount,
    this.isUp,
    this.comment,
  });

  @override
  List<Object?> get props => [
        name,
        amount,
        isUp,
        comment,
      ];
}
