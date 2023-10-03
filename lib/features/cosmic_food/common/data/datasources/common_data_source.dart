import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:cosmic_food_app/core/utils/appwrite/constants.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/data/models/foodtype_model.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/data/models/vendors_model.dart';

import '../models/users_model.dart';

abstract class CommonDataSource {
  Future<UsersModel> getUsers();
  Future<FoodtypeModel> getFoodTypes();
  Future<VendorModel> getVendors();
}

class CommonDataSourceImpl extends CommonDataSource {
  late final Client client;
  late final Account account;
  late final Databases databases;

  CommonDataSourceImpl(
      {required this.client, required this.account, required this.databases});

  @override
  Future<UsersModel> getUsers() async {
    final response = await account.get();
    final mappedResponse = response.toMap();
    final jsonResponse = json.encode(mappedResponse);
    final decodedJsonResponse = json.decode(jsonResponse);
    print(decodedJsonResponse);
    return UsersModel.fromMap(decodedJsonResponse);
  }

  @override
  Future<FoodtypeModel> getFoodTypes() async {
    final response = await databases.listDocuments(
      databaseId: AppConstants.databaseID,
      collectionId: AppConstants.foodTypeCollectionId,
    );
    final mappedResponse = response.toMap();
    final jsonResponse = json.encode(mappedResponse);
    final decodedJsonResponse = json.decode(jsonResponse);
    print(decodedJsonResponse);
    return FoodtypeModel.fromJson(decodedJsonResponse);
  }

  @override
  Future<VendorModel> getVendors() async {
    final response = await databases.listDocuments(
      databaseId: AppConstants.databaseID,
      collectionId: AppConstants.foodTypeCollectionId,
    );
    final mappedResponse = response.toMap();
    final jsonResponse = json.encode(mappedResponse);
    final decodedJsonResponse = json.decode(jsonResponse);
    print(decodedJsonResponse);
    return VendorModel.fromJson(decodedJsonResponse);
  }
}
