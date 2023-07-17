abstract class BaseLoginBlocEvent {
  void callBackEvent(String? inputDetails);
}

class SetEmailBlocEvent extends BaseLoginBlocEvent {
  @override
  void callBackEvent(String? inputDetails) {}
}

class SetPasswordBlocEvent extends BaseLoginBlocEvent {
  @override
  void callBackEvent(String? inputDetails) {}
}

class LoginBlocEvent extends BaseLoginBlocEvent {
  @override
  void callBackEvent(String? inputDetails) {}
}
