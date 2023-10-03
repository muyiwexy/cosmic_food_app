import 'package:cosmic_food_app/features/cosmic_food/common/data/models/foodtype_model.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/data/models/vendors_model.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/domain/usecases/get_foodtypes.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/domain/usecases/get_vendors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/error_message.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entities/common_cosmic_food.dart';
import '../../domain/usecases/get_user.dart';

class UsersProvider extends ChangeNotifier {
  //! Initializing the usecases
  final GetUser getUser;
  final GetFoodTypes getFoodTypes;
  final GetVendors getVendors;

  //! Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

//! User Signup State
  Users? _users;
  Users? get users => _users;
  void _setUsers(Users users) {
    _users = users;
    notifyListeners();
  }

  //! foodtypelistmodel
  List<FoodtypeModel> _foodtypeListModel = [];
  List<FoodtypeModel>? get foodtypeListModel => _foodtypeListModel;
  void _setfoodtypeListModel(List<FoodtypeModel> foodtypeListModel) {
    _foodtypeListModel = foodtypeListModel;
    print(_foodtypeListModel);
  }

  //! vendorlistmodel
  List<VendorModel> _vendorListModel = [];
  List<VendorModel>? get vendorListModel => _vendorListModel;
  void _setvendorListModel(List<VendorModel> vendorListModel) {
    _vendorListModel = vendorListModel;
    print(_vendorListModel);
  }

  //! Error State
  ErrorType? _errorType;
  ErrorType? get errorType => _errorType;
  void _setErrorMessageType(ErrorType errorType) {
    _errorType = errorType;
    notifyListeners();
  }

  //! initializing getUser
  UsersProvider({
    required this.getUser,
    required this.getFoodTypes,
    required this.getVendors,
  });

  //! user login/sign in event
  getSignedUser(context) async {
    // executes the GetUser usecase
    final result = await getUser.execute();

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        // setting the error code to a message
        _setErrorMessageType(getErrorTypeFromStatusCode(failure.code));

        _setIsLoading(false);

        // display snakbar with error message
        showSnackBar(_errorType!.errorMessage, context);
      }
    }, (users) {
      /// set the loading state to false and
      /// setting the users data to a model object [Users]
      _setIsLoading(false);

      _setUsers(users);
    });
  }

  //! get Foodtypes
  getvendorFoodtypes(context) async {
    // executes the GetFoodType usecase
    final result = await getFoodTypes.execute();

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        // setting the error code to a message
        _setErrorMessageType(getErrorTypeFromStatusCode(failure.code));

        _setIsLoading(false);

        // display snackbar with error message
        showSnackBar(_errorType!.errorMessage, context);
      }
    }, (foodtype) {
      /// set the loading state to false and
      /// setting the users data to a model object [FoodtypeModel]
      _setIsLoading(false);

      _setfoodtypeListModel(foodtype as List<FoodtypeModel>);
    });
  }

  //! get Foodtypes
  getfoodVendors(context) async {
    // executes the GetVendors usecase
    final result = await getVendors.execute();

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        // setting the error code to a message
        _setErrorMessageType(getErrorTypeFromStatusCode(failure.code));

        _setIsLoading(false);

        // display snackbar with error message
        showSnackBar(_errorType!.errorMessage, context);
      }
    }, (vendor) {
      /// set the loading state to false and
      /// setting the users data to a model object [FoodtypeModel]
      _setIsLoading(false);

      _setvendorListModel(vendor as List<VendorModel>);
    });
  }
}

showSnackBar(errorMessage, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Error: $errorMessage"),
  ));
}
