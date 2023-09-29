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

class UsersLogin extends Equatable {
  String? id;
  DateTime? createdAt;
  String? userId;
  DateTime? expire;
  String? provider;
  String? providerUid;
  String? providerAccessToken;
  String? providerRefreshToken;
  String? ip;
  String? osCode;
  String? osName;
  String? osVersion;
  String? clientType;
  String? clientCode;
  String? clientName;
  String? clientVersion;
  String? clientEngine;
  String? clientEngineVersion;
  String? deviceName;
  String? deviceBrand;
  String? deviceModel;
  String? countryCode;
  String? countryName;
  bool? current;

  UsersLogin({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.expire,
    required this.provider,
    required this.providerUid,
    required this.providerAccessToken,
    required this.providerRefreshToken,
    required this.ip,
    required this.osCode,
    required this.osName,
    required this.osVersion,
    required this.clientType,
    required this.clientCode,
    required this.clientName,
    required this.clientVersion,
    required this.clientEngine,
    required this.clientEngineVersion,
    required this.deviceName,
    required this.deviceBrand,
    required this.deviceModel,
    required this.countryCode,
    required this.countryName,
    required this.current,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        userId,
        expire,
        provider,
        providerUid,
        providerAccessToken,
        providerRefreshToken,
        ip,
        osCode,
        osName,
        osVersion,
        clientType,
        clientCode,
        clientName,
        clientVersion,
        clientEngine,
        clientEngineVersion,
        deviceName,
        deviceBrand,
        deviceModel,
        countryCode,
        countryName,
        current
      ];
}
