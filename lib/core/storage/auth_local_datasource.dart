import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

const String authBoxName = 'authBox';
const String tokenKey = 'token';
const String loginKey = 'login';

class AuthLocalDataSource {
  final Box box;

  AuthLocalDataSource(this.box);

  // Save login name as String
  Future<void> saveLogin(String login) async {
    await box.put(loginKey, login);
  }

  /// Get login name
  String? getLogin() {
    return box.get(loginKey) as String?;
  }

  /// Clear login
  Future<void> clearLogin() async {
    await box.delete(loginKey);
  }
 
  /// Save token
  Future<void> saveToken(String token) async {
    await box.put(tokenKey, token);
  }

  /// Get token
  String? getToken() {
    return box.get(tokenKey) as String?;
  }

  /// Clear token
  Future<void> clearToken() async {
    await box.delete(tokenKey);
  }
}
