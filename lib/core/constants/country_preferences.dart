import 'package:shared_preferences/shared_preferences.dart';
import 'countries.dart';

class CountryPreferences {
  static const _key = 'zoolfast_country_code';

  static Future<ZoolCountry> load() async {
    final preferences = await SharedPreferences.getInstance();
    return Countries.byCode(preferences.getString(_key) ?? 'SD');
  }

  static Future<void> save(ZoolCountry country) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_key, country.code);
  }
}
