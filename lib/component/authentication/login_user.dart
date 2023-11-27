import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_udid/flutter_udid.dart';

import 'package:crypto_login_register/component/cryptography/encrypt.dart';
import 'package:crypto_login_register/component/cryptography/save_keys.dart';

class LoginService {
  static Future<void> loginUser(
      String username, String password, Function(bool) callback) async {
    await saveUsername(username);
    try {
      // Replace the URL with your Python server endpoint for login
      final serverUrl = "http://192.168.100.58:5000/login";

      String device_udid = await FlutterUdid.consistentUdid;

      String? public_key = await getPublicKey();
      EncryptionUtils encrypt = EncryptionUtils(public_key!);
      String encrypted_username = await encrypt.encryptData(username);
      String encrypted_password = await encrypt.encryptData(password);
      String encrypted_device_udid = await encrypt.encryptData(device_udid);

      final response = await http.post(
        Uri.parse(serverUrl),
        body: {
          'device_udid': encrypted_device_udid,
          'username': encrypted_username,
          'password': encrypted_password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        bool isLoggedIn = data['is_logged_in'];

        callback(isLoggedIn);
      } else {
        print('Failed to check login status');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
