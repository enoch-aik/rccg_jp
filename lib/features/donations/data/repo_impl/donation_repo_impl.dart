import 'package:rccg_jp/core/helpers/api_interceptor.dart';
import 'package:rccg_jp/core/service_result/src/api_result.dart';
import 'package:rccg_jp/features/donations/data/data_source/donation_data_source.dart';
import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/domain/repo/donation_repo.dart';

class DonationRepoImpl extends DonationRepo {
  DonationRepoImpl(this._dataSource);

  final DonationDataSource _dataSource;

  @override
  Future<ApiResult<bool>> addDonor(Donor donor) =>
      apiInterceptor(() => _dataSource.addDonor(donor));

  @override
  ApiResult<Stream<List<Donor>>> getDonors() =>
      streamInterceptor(() => _dataSource.getDonors());

  @override
  Future<ApiResult<bool>> addDonation({required NewDonation donation, required Donor updatedDonorInfo}) =>
      apiInterceptor(() => _dataSource.addDonation(donation: donation, updatedDonorInfo: updatedDonorInfo));
}
