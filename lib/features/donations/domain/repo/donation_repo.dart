import 'package:rccg_jp/core/service_result/service_result.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';

abstract class DonationRepo {
  //get all donors
  ApiResult<Stream<List<Donor>>> getDonors();

  //add a new donor
  Future<ApiResult<bool>> addDonor(Donor donor);
}
