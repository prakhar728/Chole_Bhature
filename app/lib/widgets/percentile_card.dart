import 'package:cholebhature/theme/colors.dart';
import 'package:flutter/material.dart';

class PercentileCard extends StatefulWidget {
  double percentile;


  PercentileCard({required this.percentile});

  @override
  _PercentileCardState createState() => _PercentileCardState();
}


class _PercentileCardState extends State<PercentileCard> {


  String truncate(String text, { length: 7, omission: '' }) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("you are in top", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: DarkGray),),
          Text("${truncate((100-widget.percentile).toString(),length: 4)}%",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: DarkGray))
        ],
      ),
    );
  }
}
