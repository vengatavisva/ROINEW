import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:login_signup/screens/wrapper.dart';
import 'package:login_signup/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ROI',
      theme: lightMode,
      home: const Wrapper(),
    );
  }
}
