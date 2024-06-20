// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
      shortName: json['shortName'] as String,
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'name': instance.name,
      'rate': instance.rate,
      'shortName': instance.shortName,
      'symbol': instance.symbol,
    };
