class AuthStates {
  static const int UNINITIALIZED = 0;
  static const int UNAUTHENTICATED = 1;
  static const int AUTHENTICATED = 2;
}

class AuthenticationState {
  int state;
  String token;
  String phoneNum;
  String userId;
  String name;
  String email;
  AuthenticationState(this.state, this.token, this.phoneNum, this.userId,
      this.name, this.email);
      

  AuthenticationState update({
    int state,
    String token,
    String phoneNum,
    String userId,
    String name,
    String email,
  }) {
    return copyWith(
        state: state,
        token: token,
        phoneNum: phoneNum,
        userId: userId,
        name: name,
        email: email);
  }

  AuthenticationState copyWith(
      {int state,
      String token,
      String phoneNum,
      String userId,
      String name,
      String email}) {
    return AuthenticationState(state, token, phoneNum, userId, name, email);
  }
}
