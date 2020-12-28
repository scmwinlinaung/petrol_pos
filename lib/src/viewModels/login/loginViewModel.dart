import 'package:OilPos/src/authentication_bloc/user_repository.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  bool isSubmitting;
  bool isSuccess;
  bool isFailure;

  UserRepository userRepository = new UserRepository();

  LoginViewModel({this.isSubmitting, this.isSuccess, this.isFailure}) {
    LoginViewModel.initial(); // set Initial state in login view model
  }

  factory LoginViewModel.initial() {
    return LoginViewModel(
        isSubmitting: false, isSuccess: false, isFailure: false);
  }

  factory LoginViewModel.loading() {
    return LoginViewModel(
        isSubmitting: true,
        isSuccess: false,
        isFailure: false); // loading state
  }

  factory LoginViewModel.success() {
    return LoginViewModel(
        isSubmitting: false,
        isSuccess: true,
        isFailure: false); // success state
  }

  factory LoginViewModel.failure() {
    return LoginViewModel(
        isSubmitting: false, isSuccess: false, isFailure: true);

    /// fail state
  }

  Future<void> login(String username, String password) async {
    LoginViewModel.loading();
    try {
      await userRepository.signInWithCredentials(username, password);
      LoginViewModel.success();
    } catch (_) {
      LoginViewModel.failure();
    }
  }
}
