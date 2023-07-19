import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_store_app/app_core/depedency_injection.dart';
import 'package:tut_store_app/business/domain/usecases/login_usecase.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc_event.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc_state.dart';
import 'package:tut_store_app/presentaion/resources/assets_manager.dart';
import 'package:tut_store_app/presentaion/resources/color_manager.dart';
import 'package:tut_store_app/presentaion/resources/route_manager.dart';
import 'package:tut_store_app/presentaion/resources/strings_manager.dart';
import 'package:tut_store_app/presentaion/resources/value_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController userNameTextController;
  late final TextEditingController passwordTextController;
  @override
  void initState() {
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(loginUsecase: sl<LoginUsecase>()),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            final isValid = loginState.isValidUserName == true &&
                loginState.isValidPassword == true;
            return Container(
                padding: const EdgeInsets.only(top: AppPadding.p100),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Image(image: AssetImage(ImageAssets.splashLogo)),
                        const SizedBox(height: AppSize.s28),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: TextFormField(
                            onChanged: (text) {
                              BlocProvider.of<LoginBloc>(context).add(
                                UserNameEvent(
                                  userName: text,
                                ),
                              );
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: userNameTextController,
                            decoration: InputDecoration(
                                hintText: AppStrings.username,
                                labelText: AppStrings.username,
                                //TODO:
                                errorText: (loginState.isValidUserName ?? true)
                                    ? null
                                    : AppStrings.usernameError),
                          ),
                        ),
                        const SizedBox(height: AppSize.s28),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: TextFormField(
                            onChanged: (text) {
                              BlocProvider.of<LoginBloc>(context).add(
                                PasswordEvent(
                                  password: text,
                                ),
                              );
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordTextController,
                            decoration: InputDecoration(
                                hintText: AppStrings.password,
                                labelText: AppStrings.password,
                                //TODO:
                                errorText: (loginState.isValidPassword ?? true)
                                    ? null
                                    : AppStrings.passwordError),
                          ),
                        ),
                        const SizedBox(height: AppSize.s28),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: SizedBox(
                            width: double.infinity,
                            height: AppSize.s40,
                            child: ElevatedButton(
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                        backgroundColor: isValid
                                            ? MaterialStatePropertyAll(
                                                ColorManager.primary)
                                            : MaterialStatePropertyAll(
                                                ColorManager.grey)),
                                //TODO:
                                onPressed: () {
                                  if (isValid) {
                                    // Dispatch the LoginEvent with username and password
                                    BlocProvider.of<LoginBloc>(context).add(
                                      LoginEvent(
                                        userName: userNameTextController.text,
                                        password: passwordTextController.text,
                                      ),
                                    );
                                  }
                                },
                                child: const Text(AppStrings.login)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppPadding.p8,
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgotPasswordRoute);
                                },
                                child: Text(AppStrings.forgetPassword,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.registerRoute);
                                },
                                child: Text(AppStrings.registerText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
