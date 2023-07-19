import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_store_app/business/domain/usecases/login_usecase.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc_state.dart';

import 'login_bloc_event.dart';

const String validUsername = "username is valid";
const String validPassword = "password is ok";
const String inValidUsername = "username is invalid";
const String inValidPassword = "password is not valid";
const String unknownLoginError = "sorry unknown login error ";

class LoginBloc extends Bloc<BaseLoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({
    required this.loginUsecase,
  }) : super(
          LoginState.initial(),
        ) {
    on<UserNameEvent>(
      (event, emit) {
        //if we return true that username is valid
        if (event.isValidUserName(userName: event.userName)) {
          emit(
            LoginState(
                isLoading: false,
                userName: event.userName,
                password: state.password,
                isValidUserName: true,
                isValidPassword: state.isValidPassword,
                errorMessage: validUsername),
          );
        } else {
          //if we return false that username is valid
          emit(
            LoginState(
                isLoading: false,
                userName: event.userName,
                password: state.password,
                isValidUserName: false,
                isValidPassword: state.isValidPassword,
                errorMessage: inValidUsername),
          );
        }
      },
    );
    on<PasswordEvent>(
      (event, emit) {
        if (event.isValidPassword(password: event.password)) {
          //for true case
          emit(
            LoginState(
                isLoading: false,
                userName: state.userName,
                password: event.password,
                isValidUserName: state.isValidUserName,
                isValidPassword: true,
                errorMessage: validPassword),
          );
        } else {
          emit(
            LoginState(
                isLoading: false,
                userName: state.userName,
                password: event.password,
                isValidUserName: state.isValidUserName,
                isValidPassword: false,
                errorMessage: inValidPassword),
          );
        }
      },
    );
    on<LoginEvent>(
      (event, emit) async {
        emit(state.copyWithIsloading(true));
        if (state.isValidUserName == true &&
            state.isValidPassword == true &&
            state.isValidUserName != null &&
            state.isValidPassword != null) {
          final loginResult = await loginUsecase.execute(
            LoginUseCaseInput(
              email: event.userName,
              password: event.password,
            ),
          );
          loginResult.fold((failure) {
            emit(
              LoginState(
                isLoading: false,
                userName: state.userName,
                password: state.password,
                isValidUserName: state.isValidUserName,
                isValidPassword: state.isValidPassword,
                errorMessage: failure.message,
              ),
            );
          }, (authentication) {
            emit(
              LoginState(
                isLoading: false,
                userName: state.userName,
                password: state.password,
                isValidUserName: true,
                isValidPassword: true,
                errorMessage: null,
              ),
            );
          });
        } else {
          emit(
            LoginState(
              isLoading: false,
              userName: state.userName,
              password: state.password,
              isValidUserName: state.isValidUserName,
              isValidPassword: state.isValidUserName,
              errorMessage: unknownLoginError,
            ),
          );
        }
      },
    );
  }
}
