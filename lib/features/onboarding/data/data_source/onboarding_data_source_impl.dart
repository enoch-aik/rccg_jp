import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'onboarding_data_source.dart';

class OnboardingDataSourceImpl extends OnboardingDataSource {
  OnboardingDataSourceImpl(
      {required this.firestore, required this.firebaseAuth});

  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // get auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // when signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
