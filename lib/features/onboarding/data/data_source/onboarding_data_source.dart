import 'package:firebase_auth/firebase_auth.dart';

abstract class OnboardingDataSource {

  //sign in with google
  Future<UserCredential?> signInWithGoogle();

}