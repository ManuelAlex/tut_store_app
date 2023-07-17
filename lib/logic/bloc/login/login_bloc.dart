import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc_state.dart';

import 'login_bloc_event.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(InitialLoginBlocState()) {}
}
