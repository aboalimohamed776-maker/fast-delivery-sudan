import 'package:shared_preferences/shared_preferences.dart';

class AuthUser {
  const AuthUser({required this.name, required this.phone});
  final String name;
  final String phone;
}

class AuthService {
  static const _loggedInKey = 'auth.logged_in';
  static const _nameKey = 'auth.name';
  static const _phoneKey = 'auth.phone';
  static const _passwordKey = 'auth.password';

  Future<AuthUser?> currentUser() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(_loggedInKey) != true) return null;
    final name = preferences.getString(_nameKey);
    final phone = preferences.getString(_phoneKey);
    if (name == null || phone == null) return null;
    return AuthUser(name: name, phone: phone);
  }

  Future<AuthUser> signUp({required String name, required String phone, required String password}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_nameKey, name);
    await preferences.setString(_phoneKey, phone);
    await preferences.setString(_passwordKey, password);
    await preferences.setBool(_loggedInKey, true);
    return AuthUser(name: name, phone: phone);
  }

  Future<AuthUser?> signIn({required String phone, required String password}) async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getString(_phoneKey) != phone || preferences.getString(_passwordKey) != password) return null;
    final name = preferences.getString(_nameKey);
    if (name == null) return null;
    await preferences.setBool(_loggedInKey, true);
    return AuthUser(name: name, phone: phone);
  }

  Future<void> signOut() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_loggedInKey, false);
  }
}
