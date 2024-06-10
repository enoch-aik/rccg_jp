
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/features/donations/providers.dart';

final allDonationsStreamProvider = StreamProvider((ref) {
  return ref
      .watch(donationRepoProvider)
      .getAllDonations()
      .when(success: (data) => data, apiFailure: (e, _) => throw e);
});
