abstract class LoginBlocState {
  String email;
  String password;
  LoginBlocState({
    required this.email,
    required this.password,
  });
}

class InitialLoginBlocState extends LoginBlocState {
  InitialLoginBlocState()
      : super(
          email: "",
          password: "",
        );
}

class IsValidEmailBlocState extends LoginBlocState {
  IsValidEmailBlocState({
    required String email,
  }) : super(
          email: email,
          password: "",
        );
}

class IsValidPasswordBlocState extends LoginBlocState {
  IsValidPasswordBlocState({
    required String password,
  }) : super(
          password: password,
          email: "",
        );
}

class LoginBlocBlocState extends LoginBlocState {
  LoginBlocBlocState({
    required String password,
    required String email,
  }) : super(
          password: password,
          email: email,
        );
}
