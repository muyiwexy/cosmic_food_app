import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/entities/user_reg_cosmic_food.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/user_registration_repository.dart';

class GetUser {
  late UserRegRepo userRegRepo;

  GetUser(this.userRegRepo);

  Future<Either<Failure, Users>?>? execute() {
    return userRegRepo.getUsers();
  }
}
