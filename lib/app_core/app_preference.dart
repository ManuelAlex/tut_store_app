import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_store_app/presentaion/resources/language_manager.dart';

const String appPrefKey = "APP_PREF_KEY";

class AppPreferences {
  final SharedPreferences sharedPreferences;
  AppPreferences({
    required this.sharedPreferences,
  });
  Future<String> getAppLanguage() async {
    final prefLanguage = sharedPreferences.getString(appPrefKey);
    if (prefLanguage != null) {
      return prefLanguage;
    } else {
      return LanguageType.english.getLang();
    }
  }
}
