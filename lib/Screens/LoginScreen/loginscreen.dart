import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/Screens/AllNavigationScreen/alNavigationScreen.dart';
import 'package:tiktok/Screens/HomeScreen/homescreen.dart';
import 'package:tiktok/State_management/authprovider.dart';
import 'package:tiktok/common/button.dart';
import 'package:tiktok/common/common.dart';
import 'package:tiktok/main.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "images/tiktoks.png",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Log in to TikTok",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            commonsizebox,
            const Text(
              "Manage your account, check notifications,",
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              "comment on videos, and more",
              style: TextStyle(color: Colors.black),
            ),
            commonsizebox,
            Botton(
              tittle: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person_2_outlined),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Use Phone / email / username",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              height: 50,
              colors: Colors.transparent,
              bordercolor: Colors.black,
              ontap: () {
                context.read<AuthProvider>().login();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const AllNavigationScreen();
                  },
                ));
              },
            ),
            commonsizebox,
            Botton(
              tittle: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/facebook.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      "Continue with Facebook",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              height: 50,
              colors: Colors.transparent,
              bordercolor: Colors.black,
              ontap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ));
              },
            ),
            commonsizebox,
            Botton(
              tittle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/googlelogo.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              height: 50,
              colors: Colors.transparent,
              bordercolor: Colors.black,
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
