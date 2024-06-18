import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/dependency_injection/di_providers.dart';
import 'package:rccg_jp/features/onboarding/data/models/authorized_users.dart';

import 'data/data_source/settings_data_source_impl.dart';
import 'data/repo_impl/settings_repo_impl.dart';

final StreamProvider<List<AuthorizedUsers>> authorizedUsersProvider =
    StreamProvider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore
      .collection('config')
      .doc('authorized_emails')
      .snapshots()
      .map((event) {
    final List<dynamic> data = event.get('users');

    List<AuthorizedUsers> authorized =
        data.map((e) => AuthorizedUsers.fromJson(e)).toList();
    return authorized;
  });
});

final settingsDataSourceProvider = Provider((ref) {
  return SettingsDataSourceImpl(ref);
});

final settingsRepoProvider = Provider((ref) {
  return SettingsRepoImpl(ref.read(settingsDataSourceProvider));
});
