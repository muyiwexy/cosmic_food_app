import 'package:cosmic_food_app/features/cosmic_food/common/domain/entities/common_cosmic_food.dart';

// ignore: must_be_immutable
class FoodtypeModel extends FoodType {
  FoodtypeModel(
      {required super.id, required super.name, required super.foodname});

  factory FoodtypeModel.fromJson(Map<String, dynamic> json) => FoodtypeModel(
        id: json['\u0024id'],
        name: json['foodtype'],
        foodname: List<String>.from(json['food']),
      );

  Map<String, dynamic> toJson() {
    return {
      '\u0024id': id,
      'foodtype': name,
      'food': foodname,
    };
  }
}
