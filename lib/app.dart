import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
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
      home: const OnBoardingScreen(),
    );
  }
}

class YashuChaudhary extends StatefulWidget {
  const YashuChaudhary({super.key});

  @override
  State<YashuChaudhary> createState() => _YashuChaudharyState();
}

class _YashuChaudharyState extends State<YashuChaudhary> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
