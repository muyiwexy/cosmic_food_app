import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failures.dart';
import '../../domain/entities/common_cosmic_food.dart';
import '../../domain/usecases/get_user.dart';

enum ErrorType {
  notFound(404, 'Not found', 'we did not find your user ooh'),
  unauthorized(401, 'Unauthorized', 'omo no vex you no get access'),
  badRequest(400, 'Bad request', 'network no dey '),
  serverError(500, 'Server error', 'our server don close');

  const ErrorType(this.code, this.errorTitle, this.errorMessage);
  final int code;
  final String errorTitle;
  final String errorMessage;
}



class CommonProvider extends ChangeNotifier {
  //! Initializing the usecases
  final GetUser getUser;

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

  //! Error State
  ErrorMessage? _errorMessage;
  ErrorMessage? get errorMessage => _errorMessage;
  void _setErrorMessage(ErrorMessage errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  //! initializing user Login and user sign up
  CommonProvider({required this.getUser});

  //! user login/sign in event
  getSignedUser(context) async {
    // executes the GetUser usecase
    final result = await getUser.execute();

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        _setErrorMessage(ErrorMessage(code: failure.code));

        /// show error message and display it using the fold method
        /// from the dartz package
        _setIsLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("this is get user error code: ${errorMessage!.code}"),
        ));
      }
    }, (users) {
      _setIsLoading(false);
      _setUsers(users);
    });
  }
}

// Error message class
class ErrorMessage extends Equatable {
  final int? code;
  const ErrorMessage({required this.code});

  @override
  List<Object?> get props => [code];
}
