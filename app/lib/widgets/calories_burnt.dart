import 'package:cholebhature/theme/colors.dart';
import 'package:flutter/material.dart';

class Calories extends StatefulWidget {
  String calories;


  Calories({required this.calories});

  @override
  _CaloriesState createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,height: 0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            child: Text("🔥Calories burned",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: DarkGray)),
          ),
          Text(widget.calories,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: DarkGray),)
        ],
      ),
    );
  }
}
