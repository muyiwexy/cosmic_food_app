// ignore_for_file: must_be_immutable

import 'package:cosmic_food_app/features/cosmic_food/common/data/models/foodtype_model.dart';
import 'package:equatable/equatable.dart';

class Users extends Equatable {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? password;
  String? hash;
  DateTime? registration;
  bool? status;
  List<String>? labels;
  DateTime? passwordUpdate;
  String? email;
  String? phone;
  bool? emailVerification;
  bool? phoneVerification;
  DateTime? accessedAt;

  Users({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.password,
    required this.hash,
    required this.registration,
    required this.status,
    required this.labels,
    required this.passwordUpdate,
    required this.email,
    required this.phone,
    required this.emailVerification,
    required this.phoneVerification,
    required this.accessedAt,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        password,
        hash,
        registration,
        status,
        labels,
        passwordUpdate,
        email,
        phone,
        emailVerification,
        phoneVerification,
        accessedAt
      ];
}

class Vendors extends Equatable {
  String? id;
  String? name;
  List<FoodtypeModel>? foodtype;

  Vendors({
    required this.id,
    required this.name,
    required this.foodtype,
  });
  @override
  List<Object?> get props => [id, name, foodtype];
}

class FoodType extends Equatable {
  String? id;
  String? foodType;
  List<String>? foods;

  FoodType({required this.id, required this.foodType, required this.foods});
  @override
  List<Object?> get props => [id, foodType, foods];
}
