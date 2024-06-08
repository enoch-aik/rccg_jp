import 'package:json_annotation/json_annotation.dart';

import 'donation_amount.dart';

part 'donor.g.dart';

@JsonSerializable(explicitToJson: true)
class Donor {
  Donor({required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.amount,
    required this.installmentMonth,
    required this.pledgedAt,
    required this.updatedAt,
    required this.lastDonationAt,
    required this.donations,
    required this.currencyShortName});

  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final double amount;
  final String currencyShortName;
  final InstallmentMonth installmentMonth;
  final DateTime pledgedAt;
  final DateTime updatedAt;
  final DateTime lastDonationAt;
  final List<Donation> donations;

  factory Donor.fromJson(Map<String, dynamic> json) => _$DonorFromJson(json);

  Map<String, dynamic> toJson() => _$DonorToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Donor &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              email == other.email &&
              phoneNumber == other.phoneNumber &&
              amount == other.amount &&
              currencyShortName == other.currencyShortName &&
              installmentMonth == other.installmentMonth &&
              pledgedAt == other.pledgedAt &&
              updatedAt == other.updatedAt &&
              lastDonationAt == other.lastDonationAt &&
              donations == other.donations;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      amount.hashCode ^
      currencyShortName.hashCode ^
      installmentMonth.hashCode ^
      pledgedAt.hashCode ^
      updatedAt.hashCode ^
      lastDonationAt.hashCode ^
      donations.hashCode;
}

enum InstallmentMonth { one, two, five, ten }

extension InstallmentMonthExtension on InstallmentMonth {
  String get getName {
    switch (this) {
      case InstallmentMonth.one:
        return '1 month';
      case InstallmentMonth.two:
        return '2 months';
      case InstallmentMonth.five:
        return '5 months';
      case InstallmentMonth.ten:
        return '10 months';
    }
  }
}
