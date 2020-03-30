class AuthStates {
  static const int UNINITIALIZED = 0;
  static const int UNAUTHENTICATED = 1;
  static const int AUTHENTICATED = 2;
}

class AuthenticationState {
  int state;
  String token;
  String username;
  AuthenticationState(this.state, this.token, this.username);
}
