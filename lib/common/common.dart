import 'package:flutter/material.dart';
import 'package:tiktok/Screens/AddvadioScreen/addvadioscreen.dart';
import 'package:tiktok/Screens/FriendScreen/friendscreen.dart';
import 'package:tiktok/Screens/HomeScreen/homescreen.dart';
import 'package:tiktok/Screens/InboxScreen/inboxscreem.dart';
import '../Screens/Profile_Screen/profile_Screen.dart';

List pages = const [
  HomeScreen(),
  FriendScreen(),
  AddvadioScreen(),
  InboxScreen(),
  ProfileScreen()
];

var commonsizebox = const SizedBox(
  height: 20,
);
