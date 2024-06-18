import 'package:rccg_jp/core/helpers/api_interceptor.dart';
import 'package:rccg_jp/core/service_result/src/api_result.dart';
import 'package:rccg_jp/features/settings/data/data_source/settings_data_source_impl.dart';
import 'package:rccg_jp/features/settings/domain/repo/settings_repo.dart';

class SettingsRepoImpl extends SettingsRepo {
  SettingsRepoImpl(this._dataSource);

  final SettingsDataSourceImpl _dataSource;

  @override
  Future<ApiResult<bool>> addUser(String email) {
    return apiInterceptor(() => _dataSource.addUser(email));
  }

  @override
  Future<ApiResult<bool>> deleteUser(String email) {
   return apiInterceptor(() => _dataSource.deleteUser(email));
  }
}
