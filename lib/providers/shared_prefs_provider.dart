import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsProvider {
  late SharedPreferences _sharedPreferences;

  Future<void> initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setSessionKey(String sessionKey) async {
    await _sharedPreferences.setString('sessionKey', sessionKey);
  }

  String getSessionKey() {
    final String? sessionKey = _sharedPreferences.getString('sessionKey');
    return sessionKey ?? '';
  }

  Future<void> setUserId(int id) async {
    await _sharedPreferences.setInt('id', id);
  }

  int getUserId() {
    final int? userId = _sharedPreferences.getInt('id');
    return userId ?? -1;
  }

  Future<void> setType(String type) async {
    await _sharedPreferences.setString('type', type);
  }

  String getType() {
    final String? type = _sharedPreferences.getString('type');
    return type ?? 'User';
  }
}
