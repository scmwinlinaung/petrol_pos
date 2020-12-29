import 'package:OilPos/src/authentication_bloc/user_repository.dart';
import 'package:OilPos/src/common/general.dart';
import 'package:OilPos/src/models/login/loginModel.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  UserRepository userRepository = new UserRepository();
  LoginModel loginModel = new LoginModel();
  LoginViewModel() {
    initial();
  }

  void initial() {
    loginModel =
        LoginModel(isSubmitting: false, isSuccess: false, isFailure: false);
  }

  void loading() {
    loginModel = LoginModel(
        isSubmitting: true,
        isSuccess: false,
        isFailure: false); // loading state
  }

  void success() {
    loginModel =
        LoginModel(isSubmitting: false, isSuccess: true, isFailure: false);

    /// success state
  }

  void failure() {
    loginModel =
        LoginModel(isSubmitting: false, isSuccess: false, isFailure: true);
  }

  Future<void> login(String username, String password) async {
    loading();
    try {
      final token =
          await userRepository.signInWithCredentials(username, password);
      print("TOKe n = " + token.length.toString());
      if (token.length > 0 && token != "null") {
        print("success");
        appStorage.setItem("LOGIN_TOKEN", token);
        success();
        notifyListeners();
      } else {
        failure();
        notifyListeners();
      }
    } catch (_) {
      failure();
      notifyListeners();
    }
  }
}
