import 'package:cosmic_food_app/core/networks/network_status.dart';
import 'package:cosmic_food_app/core/utils/appwrite/constants.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/data/datasources/user_reg_data_source.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/data/repositories/user_registration_repository_impl.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/repositories/user_registration_repository.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/usecases/user_login.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/usecases/user_sign_up.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/provider/user_registration_provider.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/data/datasources/common_data_source.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/data/repositories/common_repository_impl.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/domain/repositories/common_repository.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/presentation/provider/common_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:appwrite/appwrite.dart';

import 'features/cosmic_food/common/domain/usecases/get_user.dart';

final serviceLocator = GetIt.asNewInstance();

Future<void> init() async {
  //! Features - common
  // provider
  serviceLocator.registerFactory(
    () => CommonProvider(
      getUser: serviceLocator(),
    ),
  );

  // use cases
  serviceLocator.registerLazySingleton(
    () => GetUser(serviceLocator()),
  );

  // Repository
  serviceLocator.registerLazySingleton<CommonRepo>(
    () => CommonRepoImpl(
      networkStatus: serviceLocator(),
      commonDataSource: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<CommonDataSource>(
    () => CommonDataSourceImpl(
        client: serviceLocator(), account: serviceLocator()),
  );
  //! Features - User registrations
  // provider
  serviceLocator.registerFactory(
    () => UserRegProvider(
      userLogin: serviceLocator(),
      userSignUp: serviceLocator(),
    ),
  );

  // use cases
  serviceLocator.registerLazySingleton(
    () => UserLogin(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => UserSignUp(serviceLocator()),
  );

  // Repository
  serviceLocator.registerLazySingleton<UserRegRepo>(
    () => UserRegistrationRepositoryImpl(
      networkStatus: serviceLocator(),
      userRegRemoteDataSouce: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<UserRegRemoteDataSouce>(
    () => UserRegRemoteDataSouceImpl(
        client: serviceLocator(), account: serviceLocator()),
  );

  //! Core
  serviceLocator.registerLazySingleton<NetworkStatus>(
    () => NetworkStatusImpl(
      serviceLocator(),
    ),
  );

  //! External
  final client = Client()
      .setEndpoint(AppConstants.endPoint)
      .setProject(AppConstants.projectID);
  final account = Account(client);
  serviceLocator.registerLazySingleton<Client>(() => client);
  serviceLocator.registerLazySingleton<Account>(() => account);
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
