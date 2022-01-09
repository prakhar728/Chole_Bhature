import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/screens/home_screen.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/buttons.dart';
import 'package:cholebhature/widgets/otp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class otpScreen extends StatefulWidget {
  static String id = "OTP screen";
  const otpScreen({Key? key}) : super(key: key);

  @override
  _otpScreenState createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  EmailAuth emailAuth =  new EmailAuth(sessionName: "otp");
  String _otp = "",_errorMessage = "";

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: userEmail, otpLength: 5
    );
  }

  void verify(){
    bool isVerified = emailAuth.validateOtp(recipientMail: userEmail, userOtp: _otp);
    if(_otp.length<5){
      setState(() {
        _errorMessage = "fill valid otp";
      });
    }
    else if(isVerified == false){
      setState(() {
        _errorMessage = "incorrect otp";
      });
    }else if(isVerified == true){
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: password).then((value) => FirebaseFirestore.instance.collection('users').doc(userEmail).set({
        "email" : userEmail,
        "name" : name,
        "age" : age,
        "height" : height,
        "weight" : weight
      }));
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }

  Future<String?> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  void nextScreen(context){
    Navigator.pushNamed(context, HomeScreen.id);
  }

  @override
  void initState() {
    super.initState();
    sendOtp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${name} an OTP has been sent to\n${userEmail}',textAlign: TextAlign.center,style: TextStyle(color: Gray,fontSize: 22, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
            child: OtpField(function: (otp){_otp = otp;}),
          ),
          Text(_errorMessage,style: TextStyle(fontSize: 18,color: Red),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 60),
            child: Btn1(colour: Red, label: 'verify', onPressed: (){verify();}, fontColor: Gray),
          )
        ],
      ),
    );

  }
}
