// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/Screens/LoginScreen/loginscreen.dart';
import 'package:tiktok/common/common.dart';

class AllNavigationScreen extends StatefulWidget {
  const AllNavigationScreen({super.key});

  @override
  State<AllNavigationScreen> createState() => _AllNavigationScreenState();
}

class _AllNavigationScreenState extends State<AllNavigationScreen> {
  int pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          currentIndex: pageindex,
          onTap: (value) {
            setState(() {
              pageindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people_alt_outlined,
                ),
                label: "Friends"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.messenger_outline,
                ),
                label: "Inbox"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                ),
                label: "Profile"),
          ]),
    );
  }
}
