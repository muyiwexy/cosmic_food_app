import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../common/domain/entities/common_cosmic_food.dart';
import '../repositories/user_registration_repository.dart';

class UserSignUp {
  late UserRegRepo userRegRepo;

  UserSignUp(this.userRegRepo);

  Future<Either<Failure, Users>?>? execute(
      {required String name, required String email, required String password}) {
    return userRegRepo.userSignUp(name, email, password);
  }
}
