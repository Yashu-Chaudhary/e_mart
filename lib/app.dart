import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
          backgroundColor: PColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
