import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestContainer extends StatefulWidget {
  const RequestContainer({Key? key}) : super(key: key);

  @override
  _RequestContainerState createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").doc(userEmail).collection("requests").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Red,
            ),
          );
        }
        final data = snapshot.data!.docs;
        List<req> history = [];
        for(var doc in data){
          final email = doc.get("email");
          final name = doc.get("name");

            final temp = req(email: email, name: name);
            history.add(temp);


        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 20.0),
          children: history,
        );
      },
    );
  }
}

class req extends StatefulWidget {
  String email;
  String name;


  req({required this.email, required this.name});

  @override
  _reqState createState() => _reqState();
}

class _reqState extends State<req> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // SizedBox(width: 8,),
          CircleAvatar(child: Icon(Icons.person,),backgroundColor: Red,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name,style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
              Text("<${widget.email}>",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
            ],
          ),

          Row(
            children: [
              MaterialButton(child: CircleAvatar(backgroundColor: Green,child: Icon(Icons.check,color: Colors.white,),),onPressed: (){
                // TODO accept button
                var Tempemail;
                var Tempname;
                var Tempage;
                var Tempheight;
                var Tempweight;
                var temp = FirebaseFirestore.instance.collection("users").doc(userEmail).collection("requests").doc(widget.email).get().then((doc){
                  Tempemail = doc["email"];
                  Tempname = doc["name"];
                  Tempage = doc["age"];
                  Tempheight = doc["height"];
                  Tempweight = doc["weight"];
                }).then((value) {
                  FirebaseFirestore.instance.collection("users").doc(userEmail).collection("friends").doc(widget.email).set({
                    "email" : Tempemail,
                    "name" : Tempname,
                    "age" : Tempage,
                    "height" : Tempheight,
                    "weight" : Tempweight
                  }).then((value) {
                    FirebaseFirestore.instance.collection("users").doc(widget.email).collection("friends").doc(userEmail).set({
                      "email" : userEmail,
                      "name" : name,
                      "age" : age,
                      "height" : height,
                      "weight" : weight
                    });
                  }).then((value) => FirebaseFirestore.instance.collection("users").doc(userEmail).collection("requests").doc(widget.email).delete());
                });

              },
                padding: const EdgeInsets.all(5),
                minWidth: 0,
              ),
              MaterialButton(child: CircleAvatar(backgroundColor: Red,child: Icon(Icons.cancel_outlined,color: Colors.white,size: 26,),),onPressed: (){
                FirebaseFirestore.instance.collection("users").doc(userEmail).collection("requests").doc(widget.email).delete();
                const snackBar = SnackBar(
                  content: Text('request removed'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
                padding: const EdgeInsets.all(5),
                minWidth: 0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

