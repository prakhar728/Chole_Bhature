import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankingsBody extends StatefulWidget {
  const RankingsBody({Key? key}) : super(key: key);

  @override
  _RankingsBodyState createState() => _RankingsBodyState();
}

class _RankingsBodyState extends State<RankingsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Rankings",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        Expanded(child: Rankings())
      ],
    );
  }
}


class Rankings extends StatefulWidget {
  const Rankings({Key? key}) : super(key: key);

  @override
  _RankingsState createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").orderBy("today").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Red,
            ),
          );
        }
        final data = snapshot.data!.docs.reversed;
        List<RankingBubbles> history = [];
        int i =1;
        for(var doc in data){
          final name = doc.get("name");
          final email = doc.get("email");

          final temp = RankingBubbles(rank: i, name: name, email: email);
          history.add(temp);
          i++;
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          children: history,
        );
      },
    );
  }
}

class RankingBubbles extends StatefulWidget {
  int rank;
  String name;
  String email;


  RankingBubbles({required this.rank, required this.name, required this.email});

  @override
  _RankingBubblesState createState() => _RankingBubblesState();
}

class _RankingBubblesState extends State<RankingBubbles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: widget.email == userEmail? Colors.amberAccent : Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.rank.toString(),style: TextStyle(color: DarkGray,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(child: Icon(Icons.person,),backgroundColor: Red,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                Text("<${widget.email}>",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

