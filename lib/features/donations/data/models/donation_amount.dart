import 'package:json_annotation/json_annotation.dart';

part 'donation_amount.g.dart';

@JsonSerializable()
class Donation {
  final String donationId;
  final double amount;
  final DateTime donatedAt;

  Donation(
      {required this.amount,
      required this.donatedAt,
      required this.donationId});

  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$DonationFromJson(json);

  Map<String, dynamic> toJson() => _$DonationToJson(this);
}
