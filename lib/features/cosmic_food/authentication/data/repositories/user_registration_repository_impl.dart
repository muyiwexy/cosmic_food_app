import 'package:appwrite/appwrite.dart';
import 'package:cosmic_food_app/core/errors/failures.dart';
import 'package:cosmic_food_app/core/networks/network_status.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/data/datasources/user_reg_data_source.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/entities/user_reg_cosmic_food.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/repositories/user_registration_repository.dart';
import 'package:dartz/dartz.dart';

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
        return Left(ServerFailure(code: e.code!));
      }
    } else {
      return const Left(
        ServerFailure(code: 404),
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
        return Left(ServerFailure(code: e.code!));
      }
    } else {
      return const Left(ServerFailure(code: 404));
    }
  }

  @override
  Future<Either<Failure, Users>>? getUsers() async {
    if (await networkStatus.isConnected) {
      try {
        final remoteReg = await userRegRemoteDataSouce.getUsers();
        return Right(remoteReg);
      } on AppwriteException catch (e) {
        return Left(ServerFailure(code: e.code!));
      }
    } else {
      return const Left(ServerFailure(code: 404));
    }
  }
}
