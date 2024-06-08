// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donor _$DonorFromJson(Map<String, dynamic> json) => Donor(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      installmentMonth:
          $enumDecode(_$InstallmentMonthEnumMap, json['installmentMonth']),
      pledgedAt: DateTime.parse(json['pledgedAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastDonationAt: DateTime.parse(json['lastDonationAt'] as String),
      donations: (json['donations'] as List<dynamic>)
          .map((e) => Donation.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencyShortName: json['currencyShortName'] as String,
    );

Map<String, dynamic> _$DonorToJson(Donor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'currencyShortName': instance.currencyShortName,
      'installmentMonth': _$InstallmentMonthEnumMap[instance.installmentMonth]!,
      'pledgedAt': instance.pledgedAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lastDonationAt': instance.lastDonationAt.toIso8601String(),
      'donations': instance.donations.map((e) => e.toJson()).toList(),
    };

const _$InstallmentMonthEnumMap = {
  InstallmentMonth.one: 'one',
  InstallmentMonth.two: 'two',
  InstallmentMonth.five: 'five',
  InstallmentMonth.ten: 'ten',
};
