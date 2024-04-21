import 'package:global_test_project/core/usecases/data_mapper.dart';
import 'package:global_test_project/features/auth/domain/entities/transaction_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends DataMapper<TransactionEntity> {
  final String name;
  final String amount;
  final bool isUp;
  final String? comment;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.isUp,
    this.comment,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> map) => _$TransactionModelFromJson(map);

  @override
  TransactionEntity mapToEntity() {
    return TransactionEntity(
      name: name,
      amount: amount,
      isUp: isUp,
      comment: comment,
    );
  }
}
