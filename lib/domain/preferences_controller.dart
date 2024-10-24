

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@singleton
class PreferencesController  {
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void saveToken(String value) {
    _preferences.setString(PreferenceName.token, value);
  }

  String get token => _preferences.getString(PreferenceName.token) ?? '';
}

class PreferenceName {
  static const token = 'token';
}