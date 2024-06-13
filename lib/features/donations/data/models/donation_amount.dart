import 'package:json_annotation/json_annotation.dart';

part 'donation_amount.g.dart';

@JsonSerializable()
class NewDonation {
  final String donorId;
  final String donationId;
  final String donorName;
  final double amount;
  final DateTime donatedAt;
  final String currencyShortName;
  final String insertedByName;
  final String insertedByEmail;
  final bool? isCompleteDonation;

  NewDonation(
      {required this.amount,
      required this.donatedAt,
      required this.donorName,
      required this.donorId,
      required this.donationId,
      required this.currencyShortName,
      required this.insertedByName,
      required this.insertedByEmail,
      this.isCompleteDonation = false});

  factory NewDonation.fromJson(Map<String, dynamic> json) =>
      _$NewDonationFromJson(json);

  Map<String, dynamic> toJson() => _$NewDonationToJson(this);

/*Map<String, dynamic> toFirebaseJson() {
    Uuid uuid = const Uuid();
    return {
      'donationId': uuid.v4(),
      'amount': amount,
      'donatedAt': donatedAt,
      'currencyShortName': currencyShortName,
    };
  }*/
}
