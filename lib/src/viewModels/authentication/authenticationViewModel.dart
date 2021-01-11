import 'dart:async';
import 'dart:typed_data';
import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/common/general.dart';
import 'package:OilPos/src/models/authentication/authenticationModel.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class AuthenticationViewModel extends ChangeNotifier {
  var user;
  String token;
  String username;
  String phoneNum;
  String userId;
  String email;
  String errorMessage = "  ";

  AuthenticationModel authenticationModel = new AuthenticationModel();

  ApiCall apiCall = ApiCallService();

  AuthenticationViewModel() {
    this.appStart();
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    username = username;
    token = 'token';
    return token;
  }

  void appStart() async {
    await Future.delayed(
        Duration(seconds: 1)); // wait 1 second to display splash image
    try {
      await appStorage.ready;
      final token = appStorage.getItem(loginToken);
      if (token != null) {
        AuthStates authStates = AuthStates.AUTHENTICATED;
        authenticationModel = AuthenticationModel(
            state: authStates.state,
            token: null,
            phoneNum: null,
            userId: null,
            name: null,
            email: null);
      } else {
        AuthStates authStates = AuthStates.UNAUTHENTICATED;
        authenticationModel = AuthenticationModel(
            state: authStates.state,
            token: null,
            phoneNum: null,
            userId: null,
            name: null,
            email: null);
      }
    } catch (_) {
      AuthStates authStates = AuthStates.UNAUTHENTICATED;
      authenticationModel = AuthenticationModel(
          state: authStates.state,
          token: null,
          phoneNum: null,
          userId: null,
          name: null,
          email: null);
    }
    notifyListeners();
  }

  Future<void> loginState() async {
    AuthStates authStates = AuthStates.AUTHENTICATED;
    authenticationModel = AuthenticationModel(
        state: authStates.state,
        token: authenticationModel.token,
        phoneNum: authenticationModel.phoneNum,
        userId: authenticationModel.userId,
        name: authenticationModel.name,
        email: authenticationModel.email);

    notifyListeners();
  }

  Future<void> logoutState() async {}

  // Future<String> signUpWithCredentials(
  //     String username, String phoneNum, String password) async {
  //   var salt = Salt.generateAsBase64String(10);
  //   var jsonResponse =
  //       await apiCall.callSignUpApi(username, phoneNum, password, salt);
  //   this.errorMessage =
  //       jsonResponse['message']; // need to add top of other data item
  //   this.token = jsonResponse['token'].toString();
  //   this.phoneNum = jsonResponse['user']['phone'].toString();
  //   this.username = jsonResponse['user']['name'].toString();
  //   this.email = jsonResponse['user']['email'].toString();
  //   this.userId = jsonResponse['user']['_id'].toString();

  //   return this.token;
  // }

  String formatBytesAsHexString(Uint8List bytes) {
    var result = StringBuffer();
    for (var i = 0; i < bytes.lengthInBytes; i++) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<bool> isSignedIn() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return token == 'token';
  }

  getUser() {
    return {
      'phone': this.phoneNum,
      'token': this.token,
      'userId': this.userId,
      'name': this.username,
      'email': this.email,
      'message': this.errorMessage
    };
  }

  Future<bool> signOut() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    token = '';

    return true;
  }

  Future<List> signUp(String email, String firstName, String lastName,
      String idCard, String passport, String address) async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    token = '';

    return [email, firstName, lastName, idCard, passport, address];
  }
}
