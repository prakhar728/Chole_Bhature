import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/screens/home_screen.dart';
import 'package:cholebhature/screens/registration_page.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/buttons.dart';
import 'package:cholebhature/widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthenticationScreen extends StatefulWidget {
  static String id = "authentication string";
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> with SingleTickerProviderStateMixin{
  String _email = "";
  String _password = "";
  String _errorMessage = "";

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password
      );
      getData().whenComplete(() =>  Navigator.pushNamed(context, HomeScreen.id));
    } on FirebaseAuthException catch (e) {
      _errorMessage = "incorrect email/password";
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkGray,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Hero(child: Lottie.asset('assets/animation.json'),tag: 'logo',)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Welcome Back',style: TextStyle(color: Gray,fontSize: 26),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: EmailField(function: (string){_email = string;}, label: 'email'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PassField(function: (string){_password = string;}, label: 'password'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Btn1(colour: Red, label: 'Login',
              onPressed: (){
              //TODO login button feature
                signIn();
              }
              ,fontColor: Gray,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_errorMessage,style: TextStyle(color: Red,fontSize: 18),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('new user?', style: TextStyle(fontSize: 18, color: Gray),),
              MaterialButton(
                onPressed: (){
                  getData();
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }
                ,child: Text('Sign up',style: TextStyle(fontSize: 18, color: Red)),padding: EdgeInsets.all(0),)
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
