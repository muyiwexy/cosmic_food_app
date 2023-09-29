import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/networks/network_status.dart';
import '../../domain/entities/common_cosmic_food.dart';
import '../../domain/repositories/common_repository.dart';
import '../datasources/common_data_source.dart';

class CommonRepoImpl implements CommonRepo {
  CommonDataSource commonDataSource;
  NetworkStatus networkStatus;

  CommonRepoImpl({required this.commonDataSource, required this.networkStatus});

  @override
  Future<Either<Failure, Users>>? getUsers() async {
    if (await networkStatus.isConnected) {
      try {
        final remoteReg = await commonDataSource.getUsers();
        return Right(remoteReg);
      } on AppwriteException catch (e) {
        return Left(ServerFailure(code: e.code!));
      }
    } else {
      return const Left(ServerFailure(code: 404));
    }
  }
}
