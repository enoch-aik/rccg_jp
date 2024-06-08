// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewDonation _$DonationFromJson(Map<String, dynamic> json) => NewDonation(
      amount: (json['amount'] as num).toDouble(),
      donatedAt: DateTime.parse(json['donatedAt'] as String),
      donorName: json['donorName'] as String,
      donorId: json['donorId'] as String,
      donationId: json['donationId'] as String,
      currencyShortName: json['currencyShortName'] as String,
      insertedByName: json['insertedByName'] as String,
      insertedByEmail: json['insertedByEmail'] as String,
    );

Map<String, dynamic> _$DonationToJson(NewDonation instance) => <String, dynamic>{
      'donorId': instance.donorId,
      'donationId': instance.donationId,
      'donorName': instance.donorName,
      'amount': instance.amount,
      'donatedAt': instance.donatedAt.toIso8601String(),
      'currencyShortName': instance.currencyShortName,
      'insertedByName': instance.insertedByName,
      'insertedByEmail': instance.insertedByEmail,
    };
