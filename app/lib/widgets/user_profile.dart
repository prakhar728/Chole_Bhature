
import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/progress_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  String email;
  late String name;
  late String age;
  late String height;
  late String weight;


  UserProfile({required this.email, required this.name, required this.age, required this.height, required this.weight});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: DarkGray),
        actions: [
          IconButton(onPressed: (){
            FirebaseFirestore.instance.collection("users").doc(widget.email).collection("requests").doc(userEmail).set({
              "email" : userEmail,
              "name" : name,
              "age" : age,
              "height" : height,
              "weight" : weight
            });
            const snackBar = SnackBar(
              content: Text('request sent'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          , icon: const Icon(Icons.person_add))
        ],
      ),
      backgroundColor: Gray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10,),
                      const Expanded(child: CircleAvatar(radius: double.infinity,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.person,size: 65,),
                      ),
                        flex: 1,
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.name,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("<${widget.email}>",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                              Text("${widget.height} cms, ${widget.weight} kgs",style: const TextStyle(fontSize: 20,)),
                              Text("Age : ${widget.age}",style: const TextStyle(fontSize: 20,)),
                            ],
                          ),
                        ),
                      ),
                        flex: 2,
                      )
                    ],
                  ),
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("progress",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Expanded(child: Container(
            child: Progress(email: widget.email,),
          ), flex: 2,),
        ],
      ),
    );
  }
}
