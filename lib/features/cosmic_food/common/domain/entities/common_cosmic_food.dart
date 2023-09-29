// ignore_for_file: must_be_immutable

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
