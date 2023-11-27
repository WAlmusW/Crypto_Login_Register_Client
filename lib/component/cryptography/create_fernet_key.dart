import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';

Encrypter createFernetEncrypter(String username, String deviceID) {
  String key = username + deviceID;
  var byte = sha256.convert(utf8.encode(key)).bytes;
  final b64key = Key.fromBase64(base64Url.encode(byte));
  Fernet fernet = Fernet(b64key);
  Encrypter encrypter = Encrypter(fernet);
  return encrypter;
}
