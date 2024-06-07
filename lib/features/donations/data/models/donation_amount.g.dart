// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donation _$DonationFromJson(Map<String, dynamic> json) => Donation(
      amount: (json['amount'] as num).toDouble(),
      donatedAt: DateTime.parse(json['donatedAt'] as String),
      donationId: json['donationId'] as String,
      currencyShortName: json['currencyShortName'] as String,
    );

Map<String, dynamic> _$DonationToJson(Donation instance) => <String, dynamic>{
      'donationId': instance.donationId,
      'amount': instance.amount,
      'donatedAt': instance.donatedAt.toIso8601String(),
      'currencyShortName': instance.currencyShortName,
    };
