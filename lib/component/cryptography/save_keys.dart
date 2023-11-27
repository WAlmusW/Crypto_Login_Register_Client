import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUsername(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
}

Future<String?> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<void> savePublicKey(String public_key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('public_key', public_key);
}

Future<String?> getPublicKey() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('public_key');
}
