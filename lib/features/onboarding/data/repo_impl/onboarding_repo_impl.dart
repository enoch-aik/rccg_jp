import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/helpers/api_interceptor.dart';
import 'package:rccg_jp/core/service_result/src/api_result.dart';
import 'package:rccg_jp/features/onboarding/data/data_source/onboarding_data_source_impl.dart';
import 'package:rccg_jp/features/onboarding/domain/repo/onboarding_repo.dart';
import 'package:rccg_jp/features/onboarding/providers.dart';

class OnboardingRepoImpl extends OnboardingRepo {
  OnboardingRepoImpl(this._ref);

  final Ref _ref;

  late final OnboardingDataSourceImpl _dataSource =
      _ref.read(onboardingDataProvider);

  @override
  Future<ApiResult<UserCredential?>> signInWithGoogle() {
    return apiInterceptor(() => _dataSource.signInWithGoogle());
  }
}
