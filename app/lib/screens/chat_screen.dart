import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/chat_titles.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat screen";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: DarkGray),
        title: Text("Inbox",style: TextStyle(color: DarkGray, fontSize: 22),),
      ),
      body: Container(
        child: ChatTitles(),
      ),
    );
  }
}
