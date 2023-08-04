import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tut_store_app/app_core/depedency_injection.dart';
import 'package:tut_store_app/business/domain/usecases/login_usecase.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc_event.dart';
import 'package:tut_store_app/presentaion/resources/assets_manager.dart';
import 'package:tut_store_app/presentaion/resources/color_manager.dart';
import 'package:tut_store_app/presentaion/resources/font_manager.dart';
import 'package:tut_store_app/presentaion/resources/strings_manager.dart';
import 'package:tut_store_app/presentaion/resources/styles_manager.dart';
import 'package:tut_store_app/presentaion/resources/value_manager.dart';

enum StateRendererType {
  // POPUP STATES
  popUpLoadingState,
  popUpErrorState,
  popUpSuccessState,
  // FULL SCREEN STATES
  fullScreenLoadingState,
  fullErrorLoadingState,
  contentScreenState, // THE UI OF THE SCREEN
  emptyScreenState // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String? title;
  final VoidCallback? retryActionFunction;
  const StateRenderer({
    required this.message,
    this.title,
    required this.retryActionFunction,
    required this.stateRendererType,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        loginUsecase: sl<LoginUsecase>(),
      ),
      child: _getStateWidget(context),
    );
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popUpLoadingState:
        return _getPopUpDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.popUpErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context, () {
            BlocProvider.of<LoginBloc>(context).add(LoginResetEvent());
          })
        ]);
      case StateRendererType.popUpSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(title ?? ""),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context, null)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.loading), _getMessage(message)]);
      case StateRendererType.fullErrorLoadingState:
        return _getItemsInColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain, context, null)
        ]);
      case StateRendererType.contentScreenState:
        return Container();
      case StateRendererType.emptyScreenState:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.empty), _getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Text(
          message,
          style:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
        ),
      ),
    );
  }

  Widget _getRetryButton(
      String buttonTitle, BuildContext context, VoidCallback? callback) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              onPressed: () {
                // if (stateRendererType ==
                //     StateRendererType.fullScreenLoadingState) {
                //   retryActionFunction
                //       ?.call(); // to call the API function again to retry
                // } else {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                } // popup state error so we need to dismiss the dialog
                // }
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
