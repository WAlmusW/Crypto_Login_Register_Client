import 'package:flutter_udid/flutter_udid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:crypto_login_register/component/cryptography/save_keys.dart';

class RegistrationService {
  static Future<void> checkRegistrationStatus(Function(bool) callback) async {
    try {
      // Replace the URL with your Python server endpoint
      final serverUrl = "http://192.168.100.58:5000/check_registration";

      String device_udid = await FlutterUdid.consistentUdid;

      final response = await http.post(
        Uri.parse(serverUrl),
        body: {'device_udid': device_udid},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        bool isRegistered = data['is_registered'];
        String public_key = data['public_key'];

        print(public_key);
        await savePublicKey(public_key);

        callback(isRegistered);
      } else {
        print('Failed to check registration status');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
