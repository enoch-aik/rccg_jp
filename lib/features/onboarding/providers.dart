import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/dependency_injection/di_providers.dart';
import 'package:rccg_jp/features/onboarding/data/data_source/onboarding_data_source_impl.dart';
import 'package:rccg_jp/main.dart';

import 'data/repo_impl/onboarding_repo_impl.dart';

//Firebase authentication provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => auth);

final onboardingDataProvider = Provider<OnboardingDataSourceImpl>((ref) {
  return OnboardingDataSourceImpl(
      firestore: ref.read(firestoreProvider), firebaseAuth: auth, ref: ref);
});

final onboardingRepoProvider = Provider<OnboardingRepoImpl>((ref) {
  return OnboardingRepoImpl(ref);
});

final authorizedEmailsStreamProvider = StreamProvider<List<String>>((ref) {
  return ref
      .watch(firestoreProvider)
      .collection('config')
      .doc('authorized_emails')
      .snapshots()
      .map((event) => event.get('emails').cast<String>());
});

//This is used to get the details of the current User, if there is no user, this would be null
final currentUserProvider = StateProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).currentUser;
});
