// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/Screens/AllNavigationScreen/alNavigationScreen.dart';
import 'package:tiktok/common/button.dart';
import 'package:tiktok/common/common.dart';
import 'package:tiktok/widget/textformfield.dart';

import '../../Controler/login_controler.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  // Create a GlobalKey for the Form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Instantiate the LoginController
    final LoginController loginController = Get.put(LoginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey, // Wrap the form with Form widget
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
                    "Log in to Kids360",
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
                  Textformfieldwidget(
                    hinttext: "Enter Email",
                    labetext: "Email",
                    controler: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Basic email validation
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textformfieldwidget(
                    hinttext: "Enter Password",
                    labetext: "Password",
                    controler: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // if (value.length < 6) {
                      //   return 'Password must be at least 6 characters long';
                      // }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return loginController.isLoading.value
                        ? CircularProgressIndicator() // Show loading spinner when logging in
                        : Botton(
                            tittle: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                )),
                            height: 50,
                            colors: Colors.black,
                            bordercolor: Colors.black,
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, proceed with login
                                await loginController.login(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );

                                // Navigate to InboxScreen on successful login
                                if (loginController.loginError.isEmpty) {
                                  Get.offAll(() => AllNavigationScreen());
                                  Get.snackbar("Success", "Login Succesfuly",
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green);
                                } else {
                                  // Show error if login fails
                                  Get.snackbar("Login failed",
                                      loginController.loginError.value,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red);
                                }
                              }
                            },
                          );
                  }),
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
                    ontap: () {},
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
