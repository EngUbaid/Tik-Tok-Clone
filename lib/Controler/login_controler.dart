import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:tiktok/Screens/AllNavigationScreen/alNavigationScreen.dart';
import '../Modal/user.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginError = ''.obs;
  var emailError = ''.obs; // Add for email error
  var passwordError = ''.obs; // Add for password error
  final storage = GetStorage(); // For saving token
  var user = Rxn<User>(); // For holding user data

  Future<void> login(String email, String password) async {
    isLoading(true);
    emailError.value = ''; // Reset errors
    passwordError.value = ''; // Reset errors
    try {
      var url = Uri.parse('https://kids.three60.app/api/auth/login');
      var response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        }, 
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        UserModal userModal = UserModal.fromJson(jsonResponse);
        await storage.write('authToken', userModal.token);
        await storage.write('userName', userModal.user.name);
        await storage.write('userEmail', userModal.user.email);
        await storage.write('userRegistarationDate', userModal.user.createdAt);
        user.value = userModal.user;
        Get.offAll(() => AllNavigationScreen());
      } else {
        loginError.value = 'Login failed. Check your email and password.';
      }
    } catch (e) {
      if (e is SocketException) {
        loginError.value = 'No internet connection. Please check your network.';
      } else if (e is HttpException) {
        loginError.value = 'Could not find the server. Please try again later.';
      } else if (e is FormatException) {
        loginError.value = 'Invalid response format. Please contact support.';
      } else {
        loginError.value = 'An unexpected error occurred: ${e.toString()}';
      }
      print("An error occurred: ${e.toString()}");
      loginError.value = 'An error occurred. $e.';
    } finally {
      isLoading(false);
    }
  }
}
