import 'package:flutter/material.dart';
import 'package:tut_store_app/presentaion/resources/route_manager.dart';
import 'package:tut_store_app/presentaion/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const sharedInstance = MyApp._internal();
  factory MyApp() => sharedInstance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
