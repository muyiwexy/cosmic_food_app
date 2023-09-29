import 'dart:convert';

import "package:appwrite/appwrite.dart";

import '../../../common/data/models/users_model.dart';
import '../models/users_login_model.dart';

abstract class UserRegRemoteDataSouce {
  Future<UsersLoginModel> userLogin(String email, String password);
  Future<UsersModel> userSignUp(String name, String email, String password);
}

class UserRegRemoteDataSouceImpl extends UserRegRemoteDataSouce {
  late final Client client;
  late final Account account;

  UserRegRemoteDataSouceImpl({required this.client, required this.account});
  @override
  Future<UsersLoginModel> userLogin(String email, String password) async {
    final response =
        await account.createEmailSession(email: email, password: password);
    final mappedResponse = response.toMap();
    final jsonResponse = json.encode(mappedResponse);
    final decodedJsonResponse = json.decode(jsonResponse);
    print(decodedJsonResponse);
    return UsersLoginModel.fromMap(decodedJsonResponse);
  }

  @override
  Future<UsersModel> userSignUp(
      String name, String email, String password) async {
    final response = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    final mappedResponse = response.toMap();
    final jsonResponse = json.encode(mappedResponse);
    final decodedJsonResponse = json.decode(jsonResponse);
    return UsersModel.fromMap(decodedJsonResponse);
  }
}
