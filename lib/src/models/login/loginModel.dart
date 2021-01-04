class LoginModel {
  bool isSubmitting;
  bool isSuccess;
  bool isFailure;

  LoginModel({this.isSubmitting, this.isSuccess, this.isFailure});

  bool get getIsSubmitting => this.isSubmitting;
  bool get getIsSuccess => this.isSuccess;
  bool get getIsFailure => this.isFailure;

  factory LoginModel.initial() {
    return LoginModel(isSubmitting: false, isSuccess: false, isFailure: false);
  }

  factory LoginModel.loading() {
    return LoginModel(
        isSubmitting: true,
        isSuccess: false,
        isFailure: false); // loading state
  }

  factory LoginModel.success() {
    return LoginModel(isSubmitting: false, isSuccess: true, isFailure: false);

    /// success state
  }

  factory LoginModel.failure() {
    return LoginModel(isSubmitting: false, isSuccess: false, isFailure: true);
  }
}
