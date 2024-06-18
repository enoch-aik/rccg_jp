import 'package:rccg_jp/core/service_result/service_result.dart';

abstract class SettingsRepo{
  Future<ApiResult<bool>> addUser(String email);
  Future<ApiResult<bool>> deleteUser(String email);
}