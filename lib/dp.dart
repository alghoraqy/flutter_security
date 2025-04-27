import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_security/secure_storage.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

class DependencyInjectionServices {
  static Future<void> diInit() async {
    await secureStorageInit();
  }

  static Future<void> secureStorageInit() async {
    final secureStorage =  FlutterSecureStorage();
    sl.registerLazySingleton(() => secureStorage);
    sl.registerLazySingleton<ISecureStorageManager>(
      () => SecureStorageManagerImpl(secureStorage: sl()),
    );
  }
}
