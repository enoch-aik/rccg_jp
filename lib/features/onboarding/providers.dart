

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/features/onboarding/data/data_source/onboarding_data_source_impl.dart';
import 'package:rccg_jp/main.dart';

import 'data/repo_impl/onboarding_repo_impl.dart';


final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final onboardingDataProvider = Provider<OnboardingDataSourceImpl>((ref) {
  return OnboardingDataSourceImpl(firestore: ref.read(firestoreProvider), firebaseAuth: auth);
});

final onboardingRepoProvider = Provider<OnboardingRepoImpl>((ref) {
  return OnboardingRepoImpl(ref);
});