import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:crypto_login_register/component/cryptography/encrypt.dart';
import 'package:crypto_login_register/component/cryptography/save_keys.dart';

class RegisterService {
  static Future<void> registerUser(String username, String password,
      String email, String phone_number) async {
    await saveUsername(username);
    try {
      // Replace the URL with your Python server endpoint
      final serverUrl = "http://192.168.100.58:5000/register";

      String device_udid = await FlutterUdid.consistentUdid;

      print("debug1");

      String? public_key = await getPublicKey();
      EncryptionUtils encrypt = EncryptionUtils(public_key!);
      String encrypted_username = await encrypt.encryptData(username);
      String encrypted_password = await encrypt.encryptData(password);
      String encrypted_device_udid = await encrypt.encryptData(device_udid);
      String encrypted_email = await encrypt.encryptData(email);
      String encrypted_phone_number = await encrypt.encryptData(phone_number);

      print("debug2");

      final response = await http.post(
        Uri.parse(serverUrl),
        body: {
          'username': encrypted_username,
          'password': encrypted_password,
          'device_udid': encrypted_device_udid,
          'email': encrypted_email,
          'phone_number': encrypted_phone_number,
        },
      );

      print("debug3");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        String message = data['message'];

        print(message);
      } else {
        print('Failed to register user');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
