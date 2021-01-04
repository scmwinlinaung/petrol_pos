import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/common/general.dart';
import 'package:OilPos/src/models/authentication/authenticationModel.dart';
import 'package:OilPos/src/models/login/loginModel.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  LoginModel loginModel = new LoginModel();
  AuthenticationModel authenticationModel = AuthenticationModel();
  ApiCall apiCall = new ApiCallService();
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
      final token = await signInWithCredentials(username, password);
      print("TOKe n = " + token);
      if (token.length > 0 && token != "null") {
        await appStorage.setItem(loginToken, token);
        success();
        print("success");
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

  Future<String> signInWithCredentials(String name, String password) async {
    var jsonResponse = await apiCall.callSignInApi(name, password);
    var errorMessage =
        jsonResponse['message']; // need to add top of other data item
    var token = jsonResponse['token'].toString();
    var phoneNum = jsonResponse['phone'].toString();
    var username = jsonResponse['name'].toString();
    var email = jsonResponse['email'].toString();
    appStorage.setItem(loginToken, token);
    return token;
  }
}
