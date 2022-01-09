import 'package:flutter/material.dart';

class CustCard extends StatefulWidget {
  const CustCard({Key? key}) : super(key: key);

  @override
  _CustCardState createState() => _CustCardState();
}

class _CustCardState extends State<CustCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: double.infinity,

    );
  }
}
