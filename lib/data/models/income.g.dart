// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
      amount: json['amount'] as int,
      description: json['description'] as String,
      source: $enumDecode(_$IncomeSourceEnumMap, json['source']),
    );

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'amount': instance.amount,
      'description': instance.description,
      'source': _$IncomeSourceEnumMap[instance.source]!,
    };

const _$IncomeSourceEnumMap = {
  IncomeSource.personalIncome: 'personalEncome',
  IncomeSource.realEstate: 'realEstate',
  IncomeSource.dividents: 'dividents',
};
