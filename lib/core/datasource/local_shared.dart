import 'package:shared_preferences/shared_preferences.dart';

class LocalDS {
  Future<void> saveUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }

  Future<String> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user') ?? '';
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
