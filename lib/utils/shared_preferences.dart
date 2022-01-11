import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage {
  static SharedPrefsStorage? _instance;
  static SharedPreferences? _sharedPreferences;

  static const String _STATUS_CREATE_USER = 'statusCreateUser';

  static Future<SharedPreferences> get sharedPrefs =>
      SharedPreferences.getInstance();

  static Future<SharedPrefsStorage> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefsStorage();
    }
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  static Future<bool?> getStatusCreateUser() async {
    return (await sharedPrefs).getBool(_STATUS_CREATE_USER) == null
        ? false
        : (await sharedPrefs).getBool(_STATUS_CREATE_USER);
  }

  static Future setStatusCreateUser(createUser) async =>
      (await sharedPrefs).setBool(_STATUS_CREATE_USER, createUser);

  static Future clearStatusCreateUser() async {
    (await sharedPrefs).remove(_STATUS_CREATE_USER);
  }
}
