import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/common_cosmic_food.dart';
import '../repositories/common_repository.dart';

class GetUser {
  late CommonRepo commonRepo;

  GetUser(this.commonRepo);

  Future<Either<Failure, Users>?>? execute() {
    return commonRepo.getUsers();
  }
}
