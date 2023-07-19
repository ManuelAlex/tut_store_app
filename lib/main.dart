import 'package:flutter/material.dart';

import 'app_core/app.dart';
import 'app_core/depedency_injection.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(
    MyApp(),
  );
}
