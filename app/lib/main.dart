import 'package:cholebhature/screens/authentication_screen.dart';
import 'package:cholebhature/screens/chat_screen.dart';
import 'package:cholebhature/screens/home_screen.dart';
import 'package:cholebhature/screens/loading_page.dart';
import 'package:cholebhature/screens/otp_screen.dart';
import 'package:cholebhature/screens/registration_page.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Gray,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: DarkGray,fontSize: 20,fontWeight: FontWeight.bold),

        )
      ),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id : (context) => LoadingScreen(),
        AuthenticationScreen.id : (context) => AuthenticationScreen(),
        HomeScreen.id : (context) => HomeScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        otpScreen.id : (context) => otpScreen(),
        ChatScreen.id : (context) => ChatScreen(),
      },
    );
  }
}

