abstract class SettingsDataSource {
  Future<bool> addUser(String email);
  Future<bool> deleteUser(String email);
}