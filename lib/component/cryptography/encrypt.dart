import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart' as crypto;
import 'package:pointycastle/export.dart';

class EncryptionUtils {
  late crypto.RSAPublicKey public_key;

  EncryptionUtils(String public_key_saved) {
    _parsePublicKeyFromPem(public_key_saved);
  }

  void _parsePublicKeyFromPem(String public_key_saved) {
    final parser = RSAKeyParser();
    public_key = parser.parse(public_key_saved) as crypto.RSAPublicKey;
  }

  Future<String> encryptData(String plainText) async {
    final encryptor = PKCS1Encoding(RSAEngine())
      ..init(true, PublicKeyParameter<crypto.RSAPublicKey>(public_key));

    final encryptedText =
        encryptor.process(Uint8List.fromList(utf8.encode(plainText)));

    print("Plain Text : $plainText");
    print("Encrypted Message : ${base64Encode(encryptedText)}");
    return base64Encode(encryptedText);
  }
}
