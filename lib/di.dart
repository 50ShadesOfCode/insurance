import 'package:get_it/get_it.dart';
import 'package:insurance/providers/api_provider.dart';
import 'package:insurance/providers/shared_prefs_provider.dart';

final GetIt appLocator = GetIt.instance;

final AppDi appDi = AppDi();

class AppDi {
  Future<void> initDependencies() async {
    initPrefs();
    appLocator.registerSingleton<ApiProvider>(
      ApiProvider(),
    );
  }

  Future<void> initPrefs() async {
    final SharedPrefsProvider prefsProvider = SharedPrefsProvider();
    await Future.wait(
        <Future<void>>[prefsProvider.initializeSharedPreferences()]);

    appLocator.registerSingleton<SharedPrefsProvider>(prefsProvider);
  }
}
