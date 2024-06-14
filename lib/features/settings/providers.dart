import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/dependency_injection/di_providers.dart';
import 'package:rccg_jp/features/onboarding/data/models/authorized_users.dart';

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
