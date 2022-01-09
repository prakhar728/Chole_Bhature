import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/convesrsation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatTitles extends StatefulWidget {
  const ChatTitles({Key? key}) : super(key: key);

  @override
  _ChatTitlesState createState() => _ChatTitlesState();
}

class _ChatTitlesState extends State<ChatTitles> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").doc(userEmail).collection("friends").snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Red,
              ),
            );
          }
          final data = snapshot.data!.docs;
          List<ChatTitleBubbles> history = [];
          for(var doc in data){
            final email = doc.get("email");
            final name = doc.get("name");

            final temp = ChatTitleBubbles(email: email, name: name);
            history.add(temp);
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20.0),
            children: history,
          );
        }
    );
  }
}

class ChatTitleBubbles extends StatefulWidget {
  String email;
  String name;


  ChatTitleBubbles({required this.email, required this.name});

  @override
  _ChatTitleBubblesState createState() => _ChatTitleBubblesState();
}

class _ChatTitleBubblesState extends State<ChatTitleBubbles> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Conversation(email: widget.email, name: widget.name)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        height: 80,
        width: double.infinity,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: CircleAvatar(child: Icon(Icons.person,),backgroundColor: Colors.red,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                Text("<${widget.email}>",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

