import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:flutter/material.dart';

class Exercises extends StatefulWidget {
  String exercise;
  int index;


  Exercises({required this.exercise, required this.index});

  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  List<Widget> one = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Green,
          borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("march on spot - 3 mins",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("heel digs - 60",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("knee lifts - 30",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("shoulder rolls - 20",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("knee bends - 10",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
  ];

  List<Widget> two = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("pullups - 10",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("pushups - 10",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("chinups - 15",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("dips - 20",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("jump squats - 20",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
  ];

  List<Widget> three = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("Child pose",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("Plank Pose",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("Staff Pose",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("Cobra Pose",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: double.infinity,
        height: 100,
        child: Center(child: Text("Tree Pose",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
    ),
  ];

  Widget func(){
    if(widget.index ==1){
      return ListView(
        children: one,
      );
    }
    else if(widget.index ==2){
      return ListView(
        children: two,
      );
    }
    else if(widget.index ==3){
      return ListView(
        children: three,
      );
    }
    else return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise),
        iconTheme: IconThemeData(color: DarkGray),
      ),
      body: Column(
        children: [
          Expanded(child: func()),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: MaterialButton(onPressed: (){
              // calories += 160;
              Navigator.pop(context);
            },
              child: Container(
                height: 40,
                width: 300,
                color: Red,
                child: Center(child: Text("Done",style: TextStyle(fontSize: 22),)),
              ),

            ),
          )
        ],
      ),
    );
  }
}
