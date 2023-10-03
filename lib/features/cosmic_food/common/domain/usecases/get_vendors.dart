import 'package:cosmic_food_app/features/cosmic_food/common/domain/repositories/common_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/common_cosmic_food.dart';

class GetVendors {
  late CommonRepo commonRepo;

  GetVendors(this.commonRepo);

  Future<Either<Failure, Vendors>?>? execute() {
    return commonRepo.getVendors();
  }
}
