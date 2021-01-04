import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/common/general.dart';
import 'package:OilPos/src/models/authentication/authenticationModel.dart';
import 'package:OilPos/src/models/login/loginModel.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationModel authenticationModel = AuthenticationModel();
  LoginModel loginModel = new LoginModel();
  ApiCall apiCall = new ApiCallService();
  LoginViewModel() {
    loginModel = LoginModel.initial();
  }

  Future<void> login(String username, String password) async {
    loginModel = LoginModel.loading();
    try {
      final token = await signInWithCredentials(username, password);
      print("TOKe n = " + token);
      if (token.length > 0 && token != "null") {
        // await appStorage.setItem(loginToken, token);
        loginModel = LoginModel.success();
        print("success");
        notifyListeners();
      } else {
        loginModel = LoginModel.failure();
        notifyListeners();
      }
    } catch (_) {
      loginModel = LoginModel.failure();
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
