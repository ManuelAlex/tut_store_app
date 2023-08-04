class LoginState {
  bool isLoading;
  String? userName;
  String? password;
  String? errorMessage;
  bool? isValidUserName;
  bool? isValidPassword;

  LoginState({
    required this.isLoading,
    required this.userName,
    required this.password,
    required this.isValidUserName,
    required this.isValidPassword,
    required this.errorMessage,
  });
  LoginState.initial()
      : isLoading = false,
        userName = null,
        password = null,
        isValidUserName = null,
        isValidPassword = null,
        errorMessage = null;

  LoginState copyWithIsloading(bool isLoading) => LoginState(
        isLoading: isLoading,
        password: password,
        userName: userName,
        isValidPassword: isValidPassword,
        isValidUserName: isValidUserName,
        errorMessage: errorMessage,
      );

  @override
  String toString() => {
        "isLoading": isLoading,
        "password": password,
        "userName": userName,
        "isValidPassword": isValidPassword,
        "isValidUserName": isValidUserName,
        "errorMessage": errorMessage,
      }.toString();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.isLoading == isLoading &&
        other.userName == userName &&
        other.password == password &&
        other.isValidUserName == isValidUserName &&
        other.isValidPassword == isValidPassword &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        userName.hashCode ^
        password.hashCode ^
        isValidUserName.hashCode ^
        isValidPassword.hashCode ^
        errorMessage.hashCode;
  }
}
