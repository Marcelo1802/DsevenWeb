import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getCachedUsers();
  Future<void> cacheUsers(List<UserModel> users);
  Future<UserModel?> getCachedUserById(int id);
  Future<void> cacheUser(UserModel user);
  Future<void> clearCache();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedUsersKey = 'CACHED_USERS';
  static const String cachedUserPrefix = 'CACHED_USER_';

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<UserModel>> getCachedUsers() async {
    final jsonString = sharedPreferences.getString(cachedUsersKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Nenhum cache encontrado');
    }
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    final jsonString = json.encode(users.map((user) => user.toJson()).toList());
    await sharedPreferences.setString(cachedUsersKey, jsonString);
  }

  @override
  Future<UserModel?> getCachedUserById(int id) async {
    final jsonString = sharedPreferences.getString('$cachedUserPrefix$id');
    if (jsonString != null) {
      return UserModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    final jsonString = json.encode(user.toJson());
    await sharedPreferences.setString('$cachedUserPrefix${user.id}', jsonString);
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove(cachedUsersKey);
    // Remove all cached individual users
    final keys = sharedPreferences.getKeys();
    for (final key in keys) {
      if (key.startsWith(cachedUserPrefix)) {
        await sharedPreferences.remove(key);
      }
    }
  }
}
