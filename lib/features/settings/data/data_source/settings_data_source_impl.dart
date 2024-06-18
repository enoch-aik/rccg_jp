import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/dependency_injection/di_providers.dart';
import 'package:rccg_jp/core/service_exceptions/service_exception.dart';
import 'package:rccg_jp/features/onboarding/data/models/authorized_users.dart';
import 'package:rccg_jp/features/settings/data/data_source/settings_data_source.dart';
import 'package:rccg_jp/features/settings/providers.dart';

class SettingsDataSourceImpl extends SettingsDataSource {
  SettingsDataSourceImpl(this._ref);

  final Ref _ref;

  late final _firestore = _ref.watch(firestoreProvider);

  @override
  Future<bool> addUser(String email) async {
    List<AuthorizedUsers> authorizedUsers =
        _ref.read(authorizedUsersProvider).value ?? [];

    if (authorizedUsers.where((element) => element.email == email).isNotEmpty) {
      throw const ApiExceptions.fireBaseAuthException(
          'Cannot add user\nReason: This user already exists');
    }
    authorizedUsers.add(AuthorizedUsers(email: email, isAdmin: false));

    return _firestore.collection('config').doc('authorized_emails').update({
      'users': authorizedUsers.map((e) => e.toJson()).toList()
    }).then((value) {
      return true;
    }).catchError((error) {
      throw const ApiExceptions.fireBaseAuthException(
          'Unexpected error occurred\nUnable to add user, try again}');
    });
  }

  @override
  Future<bool> deleteUser(String email) {
    _ref.invalidate(authorizedUsersProvider);
    List<AuthorizedUsers> authorizedUsers =
        _ref.read(authorizedUsersProvider).value ?? [];

    authorizedUsers.removeWhere((element) => element.email == email);

    return _firestore.collection('config').doc('authorized_emails').update({
      'users': authorizedUsers.map((e) => e.toJson()).toList()
    }).then((value) {
      return true;
    }).catchError((error) {
      throw const ApiExceptions.fireBaseAuthException(
          'Unexpected error occurred\nUnable to delete user, try again}');
    });
  }
}
