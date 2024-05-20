import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/index.dart';
import 'package:http/http.dart' as http;
import '../Home/HomeScreen.dart';
import '../Start Page/startpage.dart';
import 'chat_bubels.dart';
import 'chat_bubels2.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'ChatPage';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages2 = [];
  List<String> messages = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<String> getApiResponse(String query) async {
    var url = Uri.parse("https://api.dify.ai/v1/chat-messages");

    String apiKey = "app-q4C1Z0Rsnri7ogdZQKsHy880";

    var jsonPayload = jsonEncode({
      "inputs": {},
      "query": query,
      "response_mode": "streaming",
      "conversation_id": "",
      "user": "abc-123",
      "files": [
        {
          "type": "image",
          "transfer_method": "remote_url",
          "url": "https://cloud.dify.ai/logo/logo-site.png"
        }
      ]
    });

    var headers = {
      "Authorization": "Bearer $apiKey",
      "Content-Type": "application/json"
    };

    try {
      var response = await http.post(url, body: jsonPayload, headers: headers);

      if (response.statusCode == 200) {
        var responseLines = response.body.split('\n');
        String queryAns = '';

        for (var line in responseLines) {
          if (line.isNotEmpty) {
            var decodedLine = json.decode(line.split('data:').last);
            var message2 = decodedLine['answer'];
            if (message2 != null) {
              queryAns += message2;
            }
          }
        }
        return queryAns;
      } else {
        print("HTTP request failed with status code ${response.statusCode}");
        return "Failed to fetch data";
      }
    } catch (e) {
      print("An error occurred: $e");
      return "Error occurred";
    }
  }

  void sendMessage(String message) async{
    setState(() {
      messages2.add(message);

    });
    // Call API to get response
     String response = await getApiResponse(message);
      setState(() {
      messages.add(response);
    });
    // You can also send the message to your API here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, StartPage.routeName);
                      },
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                    const SizedBox(width: 2,),
                    const CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/images/chat.png"),
                      maxRadius: 20,
                    ),
                    const SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Kriss Benwat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 6,),
                          Text("Online", style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                        ],
                      ),
                    ),
                    const Icon(Icons.settings_outlined, color: Colors.black54,),
                  ],
                ),
              );
            },
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
      children: [
      Expanded(
    child: ListView.builder(
    itemCount: messages.length+messages2.length,
    itemBuilder: (context, index) {
    if (index % 2 == 0) {
    // User's message
    return ChatBubble2(message2: messages2[index ~/ 2]);
    } else {
    // Bot's response
    return ChatBubble(message: messages[index ~/ 2]);
    }
    },
    ),
    ),
    _buildInputField(),
    ],
    ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.only(left: 5, bottom: 5, top: 5),
      height: 60,
      width: double.infinity,

      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0x96c5c1c1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController, // Assign the controller
                    decoration: InputDecoration.collapsed(
                      hintText: "Write message...",
                      hintStyle: TextStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              String message = _textEditingController.text;
              if (message.isNotEmpty) {
                sendMessage(message);
                _textEditingController.clear();
              }
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Icon(Icons.send, color: Color(0x96c5c1c1), size: 28,),
          ),
        ],
      ),
    );
  }
}