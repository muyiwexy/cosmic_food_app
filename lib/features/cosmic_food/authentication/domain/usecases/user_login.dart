import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/user_reg_cosmic_food.dart';
import '../repositories/user_registration_repository.dart';

class UserLogin {
  late UserRegRepo userRegRepo;

  UserLogin(this.userRegRepo);

  Future<Either<Failure, UsersLogin>?>? execute(
      {required String email, required String password}) {
    return userRegRepo.userLogin(email, password);
  }
}
