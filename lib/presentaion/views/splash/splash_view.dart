import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_store_app/presentaion/resources/assets_manager.dart';
import 'package:tut_store_app/presentaion/resources/color_manager.dart';
import 'package:tut_store_app/presentaion/resources/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final Timer _timer;
  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  Future<void> _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      // appBar: AppBar(
      //   title: const Text("splash"),
      // ),
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageAssets.splashLogo,
          ),
        ),
      ),
    );
  }
}
