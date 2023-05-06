import 'package:bookly_app/Features/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashView(),
    );
  }
}
