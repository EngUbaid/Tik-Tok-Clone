import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/Screens/LoginScreen/loginscreen.dart';
import 'package:tiktok/State_management/authprovider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        title: "TikTok",
        debugShowCheckedModeBanner: false,
        home: Loginscreen(),
      ),
    );
  }
}
