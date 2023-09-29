import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/user_reg_cosmic_food.dart';

abstract class UserRegRepo {
  Future<Either<Failure, UsersLogin>>? userLogin(
      String? email, String? password);
  Future<Either<Failure, Users>>? userSignUp(
      String? name, String? email, String? password);
  Future<Either<Failure, Users>>? getUsers();
}
