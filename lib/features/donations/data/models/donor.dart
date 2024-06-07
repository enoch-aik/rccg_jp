import 'package:json_annotation/json_annotation.dart';

import 'donation_amount.dart';

@JsonSerializable(explicitToJson: true)
class Donor {
  Donor(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.amount,
      required this.installmentMonth,
      required this.pledgedAt,
      required this.updatedAt,
      required this.lastDonationAt,
      required this.donations,required this.currencyShortName});

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
