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
  bool isValidPassword({required String password}) => password.length > 5;
}

class LoginEvent implements BaseLoginEvent {
  final String userName;
  final String password;
  LoginEvent({
    required this.password,
    required this.userName,
  });
}

class LoginResetEvent implements BaseLoginEvent {
  LoginResetEvent();
}
// {
//     "email":"manuel",
//     "password":"123456",
//     "imei":"123",
//     "deviceType":"android"
// }
// {
//     "status":0,
//     "message":"success",
//     "customer":{
//         "id":"12345678",
//         "name":"manuel",
//         "numOfNotifications":12
        
//     },
//     "contact":{
//         "phone":"manuel",
//         "link":"manuel@faccebook.com",
//         "mail":"manuel@gmail.com"
        
//     }
// }