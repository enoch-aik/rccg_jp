import 'package:rccg_jp/features/donations/data/models/donor.dart';

abstract class DonationDataSource {
  //get all donors
  Stream<List<Donor>> getDonors();

  //add a new donor
  Future<bool> addDonor(Donor donor);
}
