import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:crypto_login_register/component/cryptography/encrypt.dart';
import 'package:crypto_login_register/component/cryptography/save_keys.dart';

class PostingService {
  static Future<void> postingText(String title, String body) async {
    try {
      // Replace the URL with your Python server endpoint
      final serverUrl = "http://192.168.100.58:5000/post_text";

      String? public_key = await getPublicKey();
      EncryptionUtils encrypt = EncryptionUtils(public_key!);
      String encrypted_title = await encrypt.encryptData(title);
      String encrypted_body = await encrypt.encryptData(body);

      final response = await http.post(
        Uri.parse(serverUrl),
        body: {'title': encrypted_title, 'body': encrypted_body},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        String message = data["message"];
        print(message);
      } else {
        print('Failed to post Text');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
