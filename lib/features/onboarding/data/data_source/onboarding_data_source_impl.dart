import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/features/onboarding/data/models/authorized_users.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';

import 'onboarding_data_source.dart';

class OnboardingDataSourceImpl extends OnboardingDataSource {
  OnboardingDataSourceImpl(
      {required this.firestore, required this.firebaseAuth, required this.ref});

  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final Ref ref;

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //check if user is authorized
    final List<dynamic> data = await firestore
        .collection('config')
        .doc('authorized_emails')
        .get()
        .then((value) => value.get('users'));

List<AuthorizedUsers> authorizedEmails = data.map((e) => AuthorizedUsers.fromJson(e)).toList();
    if (googleUser != null &&
        !authorizedEmails
            .where((element) =>
                element.email == googleUser.email ||
                element.email == googleUser.id)
            .isNotEmpty) {
      //throw error to notify user that they are not authorized
      throw FirebaseAuthException(
          code: 'Authorization failed',
          message:
              'Sorry, you are not authorized to use this application. Contact the admin for access.');
    }
    // get auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential? userCredential =
        await firebaseAuth.signInWithCredential(credential);
    ref.read(currentUserProvider.notifier).state = userCredential.user;
    // when signed in, return the UserCredential
    return userCredential;
  }
}
