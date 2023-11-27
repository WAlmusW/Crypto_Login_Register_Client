import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';

import 'package:crypto_login_register/component/cryptography/decrypt.dart';
import 'package:crypto_login_register/component/cryptography/encrypt.dart';
import 'package:crypto_login_register/component/cryptography/save_keys.dart';

class GettingService {
  static Future<void> gettingText(
      String title, Function(String, String) callback) async {
    try {
      // Replace the URL with your Python server endpoint
      final serverUrl = "http://192.168.100.58:5000/get_text";

      String? username = await getUsername();
      String device_udid = await FlutterUdid.consistentUdid;

      String? public_key = await getPublicKey();
      EncryptionUtils encrypt = EncryptionUtils(public_key!);
      String encrypted_title = await encrypt.encryptData(title);
      String encrypted_device_udid = await encrypt.encryptData(device_udid);
      String encrypted_username = await encrypt.encryptData(username!);

      final response = await http.post(
        Uri.parse(serverUrl),
        body: {
          'title': encrypted_title,
          'device_udid': encrypted_device_udid,
          'username': encrypted_username
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        String encrypted_title = data["encrypted_title"];
        String encrypted_body = data["encrypted_body"];

        String title = await DecryptionUtils.decryptData(encrypted_title);
        String body = await DecryptionUtils.decryptData(encrypted_body);

        callback(title, body);
      } else {
        print('Failed to get Text');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
