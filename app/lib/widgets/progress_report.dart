import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  String email;


  Progress({required this.email});

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").doc(widget.email).collection("data").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Red,
            ),
          );
        }
        final data = snapshot.data!.docs.reversed;
        List<History> history = [];
        for(var doc in data){
          final calories = doc.get("calories");
          final steps = doc.get("steps");
          final date = doc.get("date");

          final temp = History(calories: calories, steps: steps, date: date);

          history.add(temp);
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: history,
        );
      },
    );
  }
}

class History extends StatelessWidget {
  int calories,steps,date;


  History({required this.calories, required this.steps, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("date"),
                Text(DateDecoder(date),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            )),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("steps"),
                Text("$steps",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            )),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("calories"),
                Text("$calories",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            )),

          ],
        )
      ),
    );
  }
}

