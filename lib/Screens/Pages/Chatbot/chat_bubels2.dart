import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble2 extends StatelessWidget {
  final String message2;

  const ChatBubble2({Key? key, required this.message2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Color(0xff427D9D),
          ),
          child: Text(
            message2,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}