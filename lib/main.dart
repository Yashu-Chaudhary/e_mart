import 'package:e_mart/app.dart';
import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // --GetX: Init Local Storage
  await GetStorage.init();

  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then(
  (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // Todo: Initialize Authentication

  runApp(const App());
}
