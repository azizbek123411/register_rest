import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService{
  static const String key='token';
  static Future<void> write(String token)async{
    const storage=FlutterSecureStorage();
    await storage.write(key: key, value:token);
    log('saved!');
  }
  static Future<void> delete() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: key);
    log("Deleled!");
  }
  static Future<String?> read() async {
    const storage = FlutterSecureStorage();
    final data = await storage.read(key: key);
    return data;
  }
}