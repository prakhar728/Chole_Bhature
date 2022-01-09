import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/screens/authentication_screen.dart';
import 'package:cholebhature/screens/home_screen.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/utill/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading screen";
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> sizeAnim;

  @override
  void initState() {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    if(isLoggedIn){getData(); today = getoday();
    getFitData();getCoins();}
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    sizeAnim = Tween(begin: 0.0,end: 32.0,).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate)
    )..addListener(() {setState(() {
    });})..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.pushNamed(context, isLoggedIn ? HomeScreen.id : AuthenticationScreen.id);
      }});
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(child: Lottie.asset('assets/animation.json'), tag: 'logo',),
          Center(child: Text('FYTT',style: TextStyle(fontSize: 40,color: Red,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}

