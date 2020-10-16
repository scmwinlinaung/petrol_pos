import 'dart:async';
import 'dart:convert'; // for the utf8.encode method
import 'dart:typed_data';
import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class UserRepository {
  var user;
  String token;
  String username;
  String phoneNum;
  String userId;
  String email;
  String errorMessage = "  ";

  ApiCall apiCall = ApiCallService();

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    username = username;
    token = 'token';
    return token;
  }

  Future<String> signInWithCredentials(String phoneNum, String password) async {
    var jsonResponse = await apiCall.callSignInApi(phoneNum, password);
    this.errorMessage =
        jsonResponse['message']; // need to add top of other data item
    this.token = jsonResponse['token'].toString();
    this.phoneNum = jsonResponse['phone'].toString();
    this.username = jsonResponse['name'].toString();
    this.email = jsonResponse['email'].toString();
    return this.token;
  }

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
