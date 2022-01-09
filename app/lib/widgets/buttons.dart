import 'package:flutter/material.dart';

class Btn1 extends StatefulWidget {
  Color colour;
  String label;
  void Function() onPressed;
  Color fontColor;


  Btn1({required this.colour, required this.label, required this.onPressed, required this.fontColor});

  @override
  _Btn1State createState() => _Btn1State();
}

class _Btn1State extends State<Btn1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: widget.colour,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        onPressed: widget.onPressed,
        minWidth: double.infinity,
        height: 42,
        child: Text(widget.label,style: TextStyle(fontSize: 20,color: widget.fontColor),),
      ),
    );
  }
}
