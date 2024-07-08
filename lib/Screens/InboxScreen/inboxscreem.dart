import 'package:flutter/material.dart';
import 'package:tiktok/common/chat_Listtile.dart';
import 'package:tiktok/common/common_circleavtar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (context, index) {
                return CommonCircleAvtar(
                    tittle: "tittle",
                    ontap: () {},
                    image: AssetImage("images/avatar.png"));
              },
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ChatListtile(
                      title: "title",
                      subtitle: "hello this is my first meeege ",
                      time: Text(""),
                      ontap: () {},
                      image: AssetImage("images/avatar.png"));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
