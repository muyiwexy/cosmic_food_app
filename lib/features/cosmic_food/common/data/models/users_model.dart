import '../../domain/entities/common_cosmic_food.dart';

// ignore: must_be_immutable
class UsersModel extends Users {
  UsersModel(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.name,
      required super.password,
      required super.hash,
      required super.registration,
      required super.status,
      required super.labels,
      required super.passwordUpdate,
      required super.email,
      required super.phone,
      required super.emailVerification,
      required super.phoneVerification,
      required super.accessedAt});

  factory UsersModel.fromMap(Map<String, dynamic> json) => UsersModel(
        id: json["\u0024id"],
        createdAt: DateTime.parse(json["\u0024createdAt"]),
        updatedAt: DateTime.parse(json["\u0024updatedAt"]),
        name: json["name"],
        password: json["password"],
        hash: json["hash"],
        registration: DateTime.parse(json["registration"]),
        status: json["status"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        passwordUpdate: DateTime.parse(json["passwordUpdate"]),
        email: json["email"],
        phone: json["phone"],
        emailVerification: json["emailVerification"],
        phoneVerification: json["phoneVerification"],
        accessedAt: DateTime.parse(json["accessedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024id": id,
        "\u0024createdAt": createdAt!.toIso8601String(),
        "\u0024updatedAt": updatedAt!.toIso8601String(),
        "name": name,
        "password": password,
        "hash": hash,
        "registration": registration!.toIso8601String(),
        "status": status,
        "labels": List<dynamic>.from(labels!.map((x) => x)),
        "passwordUpdate": passwordUpdate!.toIso8601String(),
        "email": email,
        "phone": phone,
        "emailVerification": emailVerification,
        "phoneVerification": phoneVerification,
        "accessedAt": accessedAt!.toIso8601String(),
      };
}
