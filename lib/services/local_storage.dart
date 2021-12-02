import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _instance = Storage._internal();

  factory Storage() => _instance;

  Storage._internal();

  String _token = '';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  FlutterSecureStorage get secureStorage => _secureStorage;

  Future<String> get token async {
    _token = await secureStorage.read(key: 'token') ?? '';
    return _token;
  }
}
