import 'package:flutter/material.dart';

import 'constants/app_strings.dart';
import 'constants/app_themes.dart';
import 'core/service_locator/service_locator.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppThemes.lightTheme(context),
      home: const HomeScreen(),
    );
  }
}
