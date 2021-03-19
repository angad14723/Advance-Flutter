import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static SharedPref _instance;

  static SharedPreferences _preferences;

  static Future<SharedPref> getInstance() async {
    if (_instance == null) {
      _instance = SharedPref();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }


  static const String DARK_MODE_KEY = 'DARK_MODE';


  dynamic getPrefValue(String key) {
    var value  = _preferences.get(key);
    print('(TRACE) SharedPref:getPrefValue. key: $key value: $value');
    return value;
  }

  void saveToPref(String key, var content){
    print('(TRACE) SharedPref:saveToPref. key: $key value: $content');

    if(content is String) {
      _preferences.setString(key, content);
    }
    if(content is bool) {
      _preferences.setBool(key, content);
    }
    if(content is int) {
      _preferences.setInt(key, content);
    }
    if(content is double) {
      _preferences.setDouble(key, content);
    }
    if(content is List<String>) {
      _preferences.setStringList(key, content);
    }

  }

  void clearPref(){
    _preferences.clear();
  }

}
