abstract class BaseLoginEvent {
  const BaseLoginEvent();
}

class UserNameEvent implements BaseLoginEvent {
  String userName;
  UserNameEvent({
    required this.userName,
  });
  // checking if the users name is greater than three characters
  bool isValidUserName({required String userName}) => userName.length > 3;
}

class PasswordEvent implements BaseLoginEvent {
  String password;
  PasswordEvent({
    required this.password,
  });
  // checking if the password  is greater than 6 characters
  bool isValidPassword({required String password}) => password.length > 6;
}

class LoginEvent implements BaseLoginEvent {
  final String userName;
  final String password;
  LoginEvent({
    required this.password,
    required this.userName,
  });
}
