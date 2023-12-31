import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/common_cosmic_food.dart';

abstract class CommonRepo {
  Future<Either<Failure, Users>>? getUsers();
  Future<Either<Failure, Vendors>>? getVendors();
  Future<Either<Failure, FoodType>>? getFoodTypes();
}
