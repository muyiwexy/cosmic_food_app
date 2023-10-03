import 'package:cosmic_food_app/features/cosmic_food/common/presentation/provider/common_provider.dart';
import 'package:cosmic_food_app/features/cosmic_food/home/presentation/pages/home_pages.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/user_reg_cosmic_food.dart';
import '../../domain/usecases/user_login.dart';
import '../../domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/error_message.dart';
import '../../../../../core/errors/failures.dart';
import '../../../common/domain/entities/common_cosmic_food.dart';
import '../pages/signin_page.dart';

class UserRegProvider extends ChangeNotifier {
  //! Initializing the usecases
  final UserLogin userLogin;
  final UserSignUp userSignUp;

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
  ErrorType? _errorType;
  ErrorType? get errorType => _errorType;
  void _setErrorMessageType(ErrorType errorType) {
    _errorType = errorType;
    notifyListeners();
  }

  //! initializing user Login and user sign up
  UserRegProvider({
    required this.userLogin,
    required this.userSignUp,
  });

  //! user login/sign in event
  signInUser(String email, String password, context) async {
    // set the loading state to true
    _setIsLoading(true);

    // executes the UserLogin usecase
    final result = await userLogin.execute(email: email, password: password);

    // error handling
    result!.fold((failure) {
      // condition to check the failure runtime
      if (failure is ServerFailure) {
        // set the error code to an error message (Error state)
        _setErrorMessageType(getErrorTypeFromStatusCode(failure.code));

        // set the loading state to false
        _setIsLoading(false);

        // display snakbar with error message
        showSnackBar(_errorType!.errorMessage, context);
      }
    }, (usersLogin) async {
      /// set the users login json data to the UsersLogin model object and
      /// set the loading state to false
      _setUsersLogin(usersLogin);
      UsersProvider usersProvider =
          Provider.of<UsersProvider>(context, listen: false);
      await usersProvider.getSignedUser(context);
      _setIsLoading(false);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Homepage()),
          (route) => false);
    });
  }

  //! user signup event
  signUpUser(String email, String password, String name, context) async {
    // set the loading state to true
    _setIsLoading(true);

    // executes the userSignUp use case
    final result =
        await userSignUp.execute(name: name, email: email, password: password);

    // error handling
    result!.fold((failure) {
      if (failure is ServerFailure) {
        // set the error code to an error message (Error state)
        _setErrorMessageType(getErrorTypeFromStatusCode(failure.code));

        // set the loading state to false
        _setIsLoading(false);

        // display snakbar with error message
        showSnackBar(_errorType!.errorMessage, context);
      }
    }, (users) {
      /// set the users login json data to the UsersLogin model object and
      /// set the loading state to false
      /// Navigate to the UserSignIn page on successful authentication

      _setUsers(users);

      _setIsLoading(false);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserSignInPage(),
        ),
      );
    });
  }
}

showSnackBar(String errorMessage, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(errorMessage)),
  );
}
