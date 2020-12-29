class LoginModel {
  bool isSubmitting;
  bool isSuccess;
  bool isFailure;

  LoginModel({this.isSubmitting, this.isSuccess, this.isFailure});

  bool get getIsSubmitting => this.isSubmitting;
  bool get getIsSuccess => this.isSuccess;
  bool get getIsFailure => this.isFailure;
}
