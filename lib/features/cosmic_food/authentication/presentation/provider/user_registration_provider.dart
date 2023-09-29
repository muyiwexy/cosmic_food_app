import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/entities/user_reg_cosmic_food.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/usecases/get_user.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/usecases/user_login.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/usecases/user_sign_up.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/sign_in_page.dart';
import 'package:cosmic_food_app/features/cosmic_food/home/presentation/pages/home_pages.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failures.dart';

class UserRegProvider extends ChangeNotifier {
  //! Initializing the usecases
  final UserLogin userLogin;
  final UserSignUp userSignUp;
  final GetUser getUser;

  //! Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  //! User Login state
  UsersLogin? _usersLogin;
  UsersLogin? get usersLogin => _usersLogin;
  void _setUsersLogin(UsersLogin usersLogin) {
    _usersLogin = usersLogin;
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
  UserRegProvider(
      {required this.userLogin,
      required this.userSignUp,
      required this.getUser});

  //! user login/sign in event
  signInUser(String email, String password, context) async {
    _setIsLoading(true);

    // executes the UserLogin usecase
    final result = await userLogin.execute(email: email, password: password);

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        _setErrorMessage(ErrorMessage(code: failure.code));

        // show error message and display it using a snackbar
        _setIsLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(" this is userLogin error code: ${errorMessage!.code}"),
        ));
      }
    }, (usersLogin) async {
      _setUsersLogin(usersLogin);
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

        // Navigates to the home page on successful authentication
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Homepage(users: users),
          ),
        );
      });
    });
  }

  //! user signup event
  signUpUser(String email, String password, String name, context) async {
    _setIsLoading(true);

    final result =
        await userSignUp.execute(name: name, email: email, password: password);

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        _setErrorMessage(ErrorMessage(code: failure.code));

        _setIsLoading(false);
      }
    }, (users) {
      _setUsers(users);

      _setIsLoading(false);

      // Navigate to the UserSignIn page on successful authentication
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserSignInPage(),
        ),
      );
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
