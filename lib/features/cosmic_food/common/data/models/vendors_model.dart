import 'package:cosmic_food_app/features/cosmic_food/common/data/models/foodtype_model.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/domain/entities/common_cosmic_food.dart';

// ignore: must_be_immutable
class VendorModel extends Vendors {
  VendorModel({
    required super.id,
    required super.name,
    required super.foodtype,
  });
  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        id: json['\u0024id'],
        name: json['name'],
        foodtype: (json['foodtype'] as List<dynamic>)
            .map((e) => FoodtypeModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      '\u0024id': id,
      'vendors': name,
      'foodtype': foodtype?.map((e) => e.toJson()).toList(),
    };
  }
}
