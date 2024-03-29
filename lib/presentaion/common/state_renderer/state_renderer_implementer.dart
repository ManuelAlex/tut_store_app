// import 'package:flutter/material.dart';
// import 'package:tut_store_app/presentaion/common/state_renderer/state_renderer.dart';
// import 'package:tut_store_app/presentaion/resources/strings_manager.dart';

// abstract class FlowState {
//   StateRendererType getStateRendererType();

//   String getMessage();
// }

// // Loading State (POPUP, FULL SCREEN)

// class LoadingState extends FlowState {
//   StateRendererType stateRendererType;
//   String message;

//   LoadingState({required this.stateRendererType, String? message})
//       : message = message ?? AppStrings.loading;

//   @override
//   String getMessage() => message;

//   @override
//   StateRendererType getStateRendererType() => stateRendererType;
// }

// // error state (POPUP, FULL LOADING)
// class ErrorState extends FlowState {
//   StateRendererType stateRendererType;
//   String message;

//   ErrorState(this.stateRendererType, this.message);

//   @override
//   String getMessage() => message;

//   @override
//   StateRendererType getStateRendererType() => stateRendererType;
// }

// // CONTENT STATE

// class ContentState extends FlowState {
//   ContentState();

//   @override
//   String getMessage() => '';

//   @override
//   StateRendererType getStateRendererType() =>
//       StateRendererType.contentScreenState;
// }

// // EMPTY STATE

// class EmptyState extends FlowState {
//   String message;

//   EmptyState(this.message);

//   @override
//   String getMessage() => message;

//   @override
//   StateRendererType getStateRendererType() =>
//       StateRendererType.emptyScreenState;
// }

// // success state
// class SuccessState extends FlowState {
//   String message;

//   SuccessState(this.message);

//   @override
//   String getMessage() => message;

//   @override
//   StateRendererType getStateRendererType() =>
//       StateRendererType.popUpSuccessState;
// }

// extension FlowStateExtension on FlowState {
//   Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
//       Function retryActionFunction) {
//     switch (runtimeType) {
//       case LoadingState:
//         {
//           if (getStateRendererType() == StateRendererType.popUpLoadingState) {
//             // showing popup dialog
//             showPopUp(context, getStateRendererType(), getMessage());
//             // return the content ui of the screen
//             return contentScreenWidget;
//           } else // StateRendererType.FULL_SCREEN_LOADING_STATE
//           {
//             return StateRenderer(
//                 stateRendererType: getStateRendererType(),
//                 message: getMessage(),
//                 retryActionFunction: retryActionFunction);
//           }
//         }
//       case ErrorState:
//         {
//           dismissDialog(context);
//           if (getStateRendererType() == StateRendererType.popUpErrorState) {
//             // showing popup dialog
//             showPopUp(context, getStateRendererType(), getMessage());
//             // return the content ui of the screen
//             return contentScreenWidget;
//           } else // StateRendererType.FULL_SCREEN_ERROR_STATE
//           {
//             return StateRenderer(
//                 stateRendererType: getStateRendererType(),
//                 message: getMessage(),
//                 retryActionFunction: retryActionFunction);
//           }
//         }
//       case ContentState:
//         {
//           dismissDialog(context);
//           return contentScreenWidget;
//         }
//       case EmptyState:
//         {
//           return StateRenderer(
//               stateRendererType: getStateRendererType(),
//               message: getMessage(),
//               retryActionFunction: retryActionFunction);
//         }
//       case SuccessState:
//         {
//           // i should check if we are showing loading popup to remove it before showing success popup
//           dismissDialog(context);

//           // show popup
//           showPopUp(context, StateRendererType.popUpSuccessState, getMessage(),
//               title: AppStrings.success);
//           // return content ui of the screen
//           return contentScreenWidget;
//         }
//       default:
//         {
//           return contentScreenWidget;
//         }
//     }
//   }

//   dismissDialog(BuildContext context) {
//     if (_isThereCurrentDialogShowing(context)) {
//       Navigator.of(context, rootNavigator: true).pop(true);
//     }
//   }

//   _isThereCurrentDialogShowing(BuildContext context) =>
//       ModalRoute.of(context)?.isCurrent != true;

//   showPopUp(
//       BuildContext context, StateRendererType stateRendererType, String message,
//       {String title = ""}) {
//     WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
//         context: context,
//         builder: (BuildContext context) => StateRenderer(
//               stateRendererType: stateRendererType,
//               message: message,
//               title: title,
//               retryActionFunction: () {},
//             )));
//   }
// }
