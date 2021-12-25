import 'package:expiret/models/settings_info.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _instance = Storage._internal();

  factory Storage() => _instance;

  Storage._internal();

  String _token = '';
  final SettingsInfo _settingsInfo = SettingsInfo('', '', '', '');

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<String> get token async {
    _token = await _secureStorage.read(key: 'token') ?? '';
    return _token;
  }

  Future<SettingsInfo> get settingsInfo async {
    _settingsInfo.username = await _secureStorage.read(key: 'username') ?? '';
    _settingsInfo.password = await _secureStorage.read(key: 'password') ?? '';
    _settingsInfo.phoneNumber =
        await _secureStorage.read(key: 'phoneNumber') ?? '';
    _settingsInfo.facebookLink =
        await _secureStorage.read(key: 'facebookLink') ?? '';
    return _settingsInfo;
  }
}
