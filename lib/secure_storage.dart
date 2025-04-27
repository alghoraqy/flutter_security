import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISecureStorageManager {
  Future<void> setData({required String key, required dynamic value});
  Future<String?> getData({required String key});
  Future<void> deleteData({required String key});
  Future<void> deleteAllData();
  Future<bool> containsKey({required String key});
}

class SecureStorageManagerImpl implements ISecureStorageManager {
  late final FlutterSecureStorage secureStorage;
  SecureStorageManagerImpl({required this.secureStorage});

  static const IOSOptions _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );


  @override
  Future<void> setData({required String key, required dynamic value}) async {
    await secureStorage.write(
      key: key,
      value: value.toString(),
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
  }

  @override
  Future<String?> getData({required String key}) async {
    return secureStorage.read(
      key: key,
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
  }

  @override
  Future<void> deleteData({required String key}) async {
    await secureStorage.delete(
      key: key,
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
  }

  @override
  Future<void> deleteAllData() async {
    await secureStorage.deleteAll(
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return secureStorage.containsKey(
      key: key,
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
  }
}
