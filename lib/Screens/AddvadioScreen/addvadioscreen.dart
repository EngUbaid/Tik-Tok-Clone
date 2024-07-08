import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddvadioScreen extends StatefulWidget {
  const AddvadioScreen({super.key});

  @override
  State<AddvadioScreen> createState() => _AddvadioScreenState();
}

class _AddvadioScreenState extends State<AddvadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black12,
                    ),
                    Text(
                      "Emoji",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black12,
                ),
                // SizedBox(
                //   width: 30,
                // ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      "Upload",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
