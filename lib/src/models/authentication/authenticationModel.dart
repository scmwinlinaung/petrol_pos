import 'package:OilPos/src/authentication_bloc/authentication_state.dart';

enum AuthStates {
  UNINITIALIZED,
  UNAUTHENTICATED,
  AUTHENTICATED,
}

extension AuthStatesExtension on AuthStates {
  int get state {
    switch (this) {
      case AuthStates.UNINITIALIZED:
        return 0;
      case AuthStates.UNAUTHENTICATED:
        return 1;
      case AuthStates.AUTHENTICATED:
        return 2;
      default:
        return 0;
    }
  }

  void talk() {
    print('meow');
  }
}

class AuthenticationModel {
  final int state;
  final String token;
  final String phoneNum;
  final String userId;
  final String name;
  final String email;
  AuthenticationModel(
      {this.state,
      this.token,
      this.phoneNum,
      this.userId,
      this.name,
      this.email});

  factory AuthenticationModel.fromJson(Map<String, dynamic> result) {
    return AuthenticationModel(
        state: result['state'],
        token: result['token'] as String,
        phoneNum: result['phone'] as String,
        userId: result['userId'] as String,
        name: result['name'] as String,
        email: result['email'] as String);
  }

  Map<String, dynamic> toJson(AuthenticationModel authenticationModel) {
    return {
      'state': authenticationModel.state,
      'token': authenticationModel.token,
      'phone': authenticationModel.phoneNum,
      'userId': authenticationModel.userId,
      'name': authenticationModel.name,
      'emai': authenticationModel.email
    };
  }

  int get getState => this.state;
  String get getToken => this.token;
  String get getPhoneNum => this.phoneNum;
  String get getUserId => this.userId;
  String get getName => this.name;
  String get getEmail => this.email;
}
