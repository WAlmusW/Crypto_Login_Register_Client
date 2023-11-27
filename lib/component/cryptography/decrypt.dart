import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_udid/flutter_udid.dart';

import 'package:crypto_login_register/component/cryptography/create_fernet_key.dart';
import 'package:crypto_login_register/component/cryptography/save_keys.dart';

class DecryptionUtils {
  static Future<String> decryptData(encrypted_message) async {
    String? username = await getUsername();
    String device_udid = await FlutterUdid.consistentUdid;

    Encrypter encrypter = createFernetEncrypter(device_udid, username!);
    Encrypted encryptedMsg =
        Encrypted.from64(ascii.decode(base64Decode(encrypted_message)));
    String decrypted_message = encrypter.decrypt(encryptedMsg);
    return decrypted_message;
  }
}
