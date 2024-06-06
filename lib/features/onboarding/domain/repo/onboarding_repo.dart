import 'package:firebase_auth/firebase_auth.dart';
import 'package:rccg_jp/core/service_result/service_result.dart';

abstract class OnboardingRepo {
  //sign in with google
  Future<ApiResult<UserCredential?>> signInWithGoogle();
}
