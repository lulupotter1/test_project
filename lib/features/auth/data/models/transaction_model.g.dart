// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      name: json['name'] as String,
      amount: json['amount'] as String,
      isUp: json['isUp'] as bool,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'isUp': instance.isUp,
      'comment': instance.comment,
    };
