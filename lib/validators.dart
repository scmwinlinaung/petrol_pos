class Validators {
  static final RegExp _userNameRegExp = RegExp(
    r'^[a-zA-Z0-9]{5,15}$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidUserName(String username) {
    return _userNameRegExp.hasMatch(username);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
