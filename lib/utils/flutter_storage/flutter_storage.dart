import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Map<String, String>> readAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll(
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
    return map;
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll(
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      // _readAll();
    } catch (e) {
      print(e);
    }
  }

  Future<String> readSecureData(String key) async {
    String value = "";
    try {
      print('HI $key');
      value =
          (await _storage.read(key: key, aOptions: _getAndroidOptions())) ?? "";
      print(value);
    } catch (e) {
      print(e);
    }
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      print(e);
    }
  }

  Future<void> writeSecureData(String key, String value) async {
    try {
      // print('SOMETHING $key $value');
      await _storage.write(
        key: key,
        value: value,
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
  }

  // IOSOptions _getIOSOptions() {
  //   return IOSOptions(
  //     accessibility: IOSAccessibility.first_unlock,
  //   );
  // }

  AndroidOptions _getAndroidOptions() {
    return AndroidOptions(encryptedSharedPreferences: true);
  }
}
