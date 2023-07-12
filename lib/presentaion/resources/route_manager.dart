import 'package:flutter/material.dart';
import 'package:tut_store_app/presentaion/resources/strings_manager.dart';
import 'package:tut_store_app/presentaion/views/onboarding/onbording_view.dart';
import 'package:tut_store_app/presentaion/views/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      // case Routes.loginRoute:
      //   return MaterialPageRoute(builder: (_) => const SizedBox());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      // case Routes.registerRoute:
      //   const SizedBox();
      //   return MaterialPageRoute(builder: (_) => const SizedBox());
      // case Routes.forgotPasswordRoute:
      //   const SizedBox();
      //   return MaterialPageRoute(builder: (_) => const SizedBox());
      // case Routes.mainRoute:
      //   const SizedBox();
      //   return MaterialPageRoute(builder: (_) => const SizedBox());
      // case Routes.storeDetailsRoute:
      //   const SizedBox();
      //   return MaterialPageRoute(builder: (_) => const SizedBox());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
