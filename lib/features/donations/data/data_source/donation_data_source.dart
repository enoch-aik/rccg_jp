import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';

abstract class DonationDataSource {
  //get all donors
  Stream<List<Donor>> getDonors();

  //add a new donor
  Future<bool> addDonor(Donor donor);

  Future<bool> addDonation({required NewDonation donation, required Donor updatedDonorInfo});
}
