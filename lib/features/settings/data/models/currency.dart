import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency {
  final String name;
  final double rate;
  final String shortName;
  final String symbol;

  Currency(
      {required this.name,
      required this.rate,
      required this.shortName,
      required this.symbol});


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          rate == other.rate &&
          shortName == other.shortName &&
          symbol == other.symbol;

  @override
  int get hashCode =>
      name.hashCode ^ rate.hashCode ^ shortName.hashCode ^ symbol.hashCode;

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
