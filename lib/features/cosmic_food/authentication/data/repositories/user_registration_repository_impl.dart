import 'package:appwrite/appwrite.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/networks/network_status.dart';
import '../datasources/user_reg_data_source.dart';
import '../../domain/entities/user_reg_cosmic_food.dart';
import '../../domain/repositories/user_registration_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../common/domain/entities/common_cosmic_food.dart';

class UserRegistrationRepositoryImpl implements UserRegRepo {
  UserRegRemoteDataSouce userRegRemoteDataSouce;
  NetworkStatus networkStatus;

  UserRegistrationRepositoryImpl(
      {required this.userRegRemoteDataSouce, required this.networkStatus});

  @override
  Future<Either<Failure, UsersLogin>>? userLogin(
      String? email, String? password) async {
    if (await networkStatus.isConnected) {
      try {
        final remoteReg =
            await userRegRemoteDataSouce.userLogin(email!, password!);
        return Right(remoteReg);
      } on AppwriteException catch (e) {
        print("this is the error code ${e.code} and the error message ${e.message}");
        return Left(ServerFailure(code: e.code!));
      }
    } else {
      return const Left(
        ServerFailure(code: 600),
      );
    }
  }

  @override
  Future<Either<Failure, Users>>? userSignUp(
      String? name, String? email, String? password) async {
    if (await networkStatus.isConnected) {
      try {
        final remoteReg =
            await userRegRemoteDataSouce.userSignUp(name!, email!, password!);
        return Right(remoteReg);
      } on AppwriteException catch (e) {
        print("this is the error code ${e.code} and the error message ${e.message}");
        return Left(ServerFailure(code: e.code!));
      }
    } else {
      return const Left(ServerFailure(code: 600));
    }
  }
}
