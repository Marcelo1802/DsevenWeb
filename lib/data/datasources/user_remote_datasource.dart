import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserById(int id);
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> updateUser(UserModel user);
  Future<void> deleteUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar usuários');
    }
  }

  @override
  Future<UserModel> getUserById(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar usuário');
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final response = await client.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar usuário');
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    final response = await client.put(
      Uri.parse('$baseUrl/users/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao atualizar usuário');
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/users/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar usuário');
    }
  }
}
