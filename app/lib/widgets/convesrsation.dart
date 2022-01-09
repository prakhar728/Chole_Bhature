import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  String email;
  String name;

  Conversation({required this.email, required this.name});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {

  String message = "";
  final messageTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: DarkGray),
        title: Text(widget.name,style: TextStyle(color: DarkGray, fontSize: 22),),

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessagesStream(SenderEmail: widget.email),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (str) {
                          message = str;
                        },
                        controller: messageTextEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(color: Red, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(color: Red, width: 1),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(color: Red, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                            BorderSide(color: Red, width: 1),
                          ),
                          filled: true,
                          hintText: 'write message',
                          fillColor: Colors.white,
                        ),
                        cursorColor: Red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        backgroundColor: Red,
                        radius: 24,
                        child: IconButton(
                          icon: Icon(Icons.send,color: Colors.white,),
                          onPressed: (){
                            var now = DateTime.now();
                            FirebaseFirestore.instance.collection("users").doc(userEmail).collection("friends").doc(widget.email).collection("messages").add({
                              'sender': userEmail,
                              'text' : message,
                              'time' : now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString()+"-"+now.hour.toString()+"-"+now.minute.toString()+"-"+now.second.toString()
                            });

                            FirebaseFirestore.instance.collection("users").doc(widget.email).collection("friends").doc(userEmail).collection("messages").add({
                              'sender': userEmail,
                              'text' : message,
                              'time' : now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString()+"-"+now.hour.toString()+"-"+now.minute.toString()+"-"+now.second.toString()
                            });
                            messageTextEditingController.clear();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  String SenderEmail;


  MessagesStream({required this.SenderEmail});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(userEmail).collection('friends').doc(SenderEmail).collection('messages').orderBy("time").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Red,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<ChatBubble> messageBubbles = [];
        for (var message in messages) {

          final messageSender = message.get('sender');
          final messageText = message.get('text');

          final currentUser = userEmail;

          final messageBubble = ChatBubble(
              messageSender,messageText,currentUser != messageSender
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }

}
class ChatBubble extends StatefulWidget {
  String user;
  String Message;
  bool others;

  ChatBubble(this.user,this.Message, this.others);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: widget.others ? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          // Text(widget.user,style: TextStyle(fontSize: 14),),
          Material(
            elevation: 2,

            borderRadius:widget.others ? BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20)):BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: widget.others ? Colors.white:Red,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(widget.Message,style: TextStyle(fontSize: 20,),),
            ),
          )
        ],
      ),
    );
  }
}
