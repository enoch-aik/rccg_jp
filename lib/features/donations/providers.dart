import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/features/donations/data/data_source/donation_data_source_impl.dart';
import 'package:rccg_jp/features/donations/data/repo_impl/donation_repo_impl.dart';

final donationDataSourceProvider =
    Provider((ref) => DonationDataSourceImpl(ref));

final donationRepoProvider = Provider((ref) {
  return DonationRepoImpl(ref.read(donationDataSourceProvider));
});

final allDonorsStreamProvider = StreamProvider((ref) {
  return ref
      .watch(donationRepoProvider)
      .getDonors()
      .when(success: (data) => data, apiFailure: (e, _) => throw e);
});
