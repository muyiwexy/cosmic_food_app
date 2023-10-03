import 'package:cosmic_food_app/features/cosmic_food/common/domain/entities/common_cosmic_food.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/domain/repositories/common_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';

class GetFoodTypes {
  late CommonRepo commonRepo;

  GetFoodTypes(this.commonRepo);

  Future<Either<Failure, FoodType>?>? execute() {
    return commonRepo.getFoodTypes();
  }
}
