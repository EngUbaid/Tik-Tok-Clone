// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiktok/Screens/AddvadioScreen/addvadioscreen.dart';
import 'package:tiktok/Screens/LoginScreen/loginscreen.dart';
import 'package:tiktok/Screens/Splash_Screen/splash_screen.dart';
import 'package:tiktok/Screens/myhomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TikTok",
      debugShowCheckedModeBanner: false,
      home: AddvadioScreen(),
    );
  }
}

// ChewieController chewieController = ChewieController(
//   videoPlayerController: videoPlayerController,
//   aspectRatio: 1.0,

//   autoPlay:
//       false, // Set this to true if you want videos to play automatically
//   looping: false,
// );

// return Chewie(controller: chewieController);

// return InkWell(
//   onTap: () {
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) {
//         return ProfileVideoes(imagepath: pathv);
//       },
//     ));
//   },
//   // child:  Container(
//   // color: Colors.green,
//   child: Chewie(controller: chewieController),
// );
// return Container(
//   color: Colors.green,
//   child: Center(
//     child: Text("video $index"),
//   ),
// );