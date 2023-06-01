import 'package:dio/dio.dart';
import 'package:insurance/di.dart';
import 'package:insurance/models/request.dart';
import 'package:insurance/providers/shared_prefs_provider.dart';

class ApiProvider {
  final Dio _dio = Dio();

  static const String base = 'http://192.168.0.105:8000/';

  Future<void> register(
      String login, String name, String type, String password) async {
    final Response res = await _dio.post('http://192.168.0.105:8000/register',
        data: {
          'login': login,
          'name': name,
          'type': type,
          'password': password
        });

    print(res.statusCode);
    print(res.data);
    await appLocator
        .get<SharedPrefsProvider>()
        .setUserId(res.data['id'] as int);
    await appLocator
        .get<SharedPrefsProvider>()
        .setType(res.data['type'] as String);
  }

  Future<void> login(
    String login,
    String password,
  ) async {
    final Response res =
        await _dio.post('http://192.168.0.105:8000/login', queryParameters: {
      'login': login,
      'password': password,
    });
    print(res.data);
    await appLocator
        .get<SharedPrefsProvider>()
        .setUserId(res.data['id'] as int);
    await appLocator
        .get<SharedPrefsProvider>()
        .setType(res.data['type'] as String);
  }

  Future<void> createRequest(String name, String description) async {
    final int userId = appLocator.get<SharedPrefsProvider>().getUserId();
    try {
      await _dio.post('http://192.168.0.105:8000/createRequest?user_id=$userId',
          data: {
            'name': name,
            'userDescription': description,
            'status': 'In Review'
          });
    } catch (e) {
      print('ok');
    }
  }

  Future<List<Request>> getRequests() async {
    final int userId = appLocator.get<SharedPrefsProvider>().getUserId();
    final Response res =
        await _dio.get('http://192.168.0.105:8000/getRequests/$userId');
    print((res.data as List<Map<String, dynamic>>)
        .map(Request.fromJson)
        .toList());
    return (res.data as List<Map<String, dynamic>>)
        .map(Request.fromJson)
        .toList();
  }

  //Future<AuthResult> login() async {}
}
