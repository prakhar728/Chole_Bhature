import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  String Search;


  SearchContainer({required this.Search});

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").orderBy("name").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Red,
            ),
          );
        }
        final data = snapshot.data!.docs;
        List<SearchIds> history = [];
        for(var doc in data){
          final email = doc.get("email");
          final name = doc.get("name");
          final age = doc.get("age");
          final height = doc.get("height");
          final weight = doc.get("weight");

          if(name.toString().contains(widget.Search)){
            final temp = SearchIds(email: email, name: name, age: age, height: height, weight: weight);
            history.add(temp);
          }

        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 20.0),
          children: history,
        );
      },
    );
  }
}


class SearchIds extends StatefulWidget {
  String email;
  String name;
  String age;
  String height;
  String weight;


  SearchIds({required this.email, required this.name, required this.age, required this.height, required this.weight});

  @override
  _SearchIdsState createState() => _SearchIdsState();
}

class _SearchIdsState extends State<SearchIds> {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: (){
          print(
            Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile(email: widget.email, age: widget.age, height: widget.height, weight: widget.weight, name: widget.name,)))
          );
          },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            height: 80,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(width: 8,),
                CircleAvatar(child: Icon(Icons.person,),backgroundColor: Red,),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.name}",style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                    Text("<${widget.email}>",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
