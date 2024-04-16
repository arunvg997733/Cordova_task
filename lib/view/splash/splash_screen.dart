import 'dart:async';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/view/user_list/user_list_screen.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(() => const UserListScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: textWidget(
              text: 'Cordova Task',
              size: veryLargeFont,
              weight: FontWeight.bold),
        ),
      ),
    );
  }
}
