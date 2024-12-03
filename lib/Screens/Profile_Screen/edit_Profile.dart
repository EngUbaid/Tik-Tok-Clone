// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EditProfilescreen extends StatefulWidget {
  const EditProfilescreen({super.key});

  @override
  State<EditProfilescreen> createState() => _EditProfilescreenState();
}

class _EditProfilescreenState extends State<EditProfilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1695653420624-4a23b2ffc77c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  Text("Change Profile")
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("about You"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Name"), Text("ubaid")],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("username"), Text("username")],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Bio"), Text("add bio")],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Social"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("instagram"), Text("add instagram link")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("youtube"), Text("add youtube link")],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Change display order"),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Add yours"),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  editdata(String name, String username, String bio) {
    return Column(
      children: [
        Row(
          children: [Text(name), Text(username), Text(bio)],
        )
      ],
    );
  }
}
