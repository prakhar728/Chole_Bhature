import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/screens/home_screen.dart';
import 'package:cholebhature/screens/otp_screen.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/buttons.dart';
import 'package:cholebhature/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email,_pass,_confpass,_name,_age,_height,_weight;
  String ErrorMessage = "";
  void vallidator(){
    if(_confpass==_pass && _email != null && _confpass.length>=6 && _name.length>=1 && _age != null && _height != null && _weight != null){
      userEmail = _email;
      name = _name;
      age = _age;
      height = _height;
      weight = _weight;
      password = _pass;
      Navigator.pushNamed(context, otpScreen.id);
    }
    else{
      setState(() {
        ErrorMessage = "Fill details correctly";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pop(context);},backgroundColor: Colors.transparent,child: Icon(Icons.arrow_back_ios_new,color: Gray,),elevation: 0,splashColor: Colors.transparent,),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor: DarkGray,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(child: Lottie.asset('assets/animation.json'),tag: 'logo',),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Register yourself',style: TextStyle(fontSize: 22,color: Gray),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: EmailField(function: (string ){_email = string;}, label: 'email'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PassField(function: (string){_pass = string;}, label: 'password'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PassField(function: (string){_confpass = string;}, label: 'confirm password'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: NameField(function: (name){_name = name;}, label: 'name',),flex: 3,),
                  SizedBox(width: 10,),
                  Expanded(child: NumberField(function: (age){_age = age;}, label: 'age'),flex: 1,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: NumberField(function: (height){_height = height;}, label: 'height',),),
                  SizedBox(width: 10,),
                  Expanded(child: NumberField(function: (weight){_weight = weight;}, label: 'weight'),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(ErrorMessage,style: TextStyle(fontSize: 18,color: Red),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Btn1(colour: Red, label: 'Submit', onPressed: (){vallidator();}, fontColor: Gray),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );

  }
}
