// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiktok/Screens/LoginScreen/loginscreen.dart';
import 'package:tiktok/Screens/AllNavigationScreen/alNavigationScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      String? token = storage.read('authToken');
      if (token != null && token.isNotEmpty) {
        Get.offAll(() => AllNavigationScreen());
      } else {
        Get.offAll(() => Loginscreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/tiktoks.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Text(
              "Kids360",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
