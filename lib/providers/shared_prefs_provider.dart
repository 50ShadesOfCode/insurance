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
}
