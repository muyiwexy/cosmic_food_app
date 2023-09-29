// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

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
