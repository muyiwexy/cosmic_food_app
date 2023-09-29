import 'dart:convert';

import 'package:appwrite/appwrite.dart';

import '../models/users_model.dart';

abstract class CommonDataSource {
  Future<UsersModel> getUsers();
}

class CommonDataSourceImpl extends CommonDataSource {
  late final Client client;
  late final Account account;

  CommonDataSourceImpl({required this.client, required this.account});

  @override
  Future<UsersModel> getUsers() async {
    final response = await account.get();
    final mappedResponse = response.toMap();
    final jsonResponse = json.encode(mappedResponse);
    final decodedJsonResponse = json.decode(jsonResponse);
    return UsersModel.fromMap(decodedJsonResponse);
  }
}
