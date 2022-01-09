import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/screens/authentication_screen.dart';
import 'package:cholebhature/screens/chat_screen.dart';
import 'package:cholebhature/screens/home_body/account_body.dart';
import 'package:cholebhature/screens/home_body/friends_body.dart';
import 'package:cholebhature/screens/home_body/home_body.dart';
import 'package:cholebhature/screens/home_body/rankings_body.dart';
import 'package:cholebhature/screens/wallet_screen.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  _HomeScreenState(){
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton("33efea5f5b6a5e873e4491351db7cb2b2e956eca572e1d8b807a3e2338fdd0dc/stage" ,bottomMargin: 200,);


    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand (Map<String , dynamic> command){
    switch(command["command"]){
      case "steps":
        AlanVoice.playText("${todaySteps.toString()} steps");
        break;
      case "calories":
        AlanVoice.playText("you burned ${calories.toString()} calories");
        break;
      case "rank":
        AlanVoice.playText("your rank is in top ${truncate(rank,length: 4)} %");
        break;
      case "pop":
        AlanVoice.playText("ok");
        Navigator.pop(context);
        break;
      case "inbox":
        AlanVoice.playText("ok");
        Navigator.pushNamed(context, ChatScreen.id);
        break;
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget selectBody(int index){
    if(index==0){
      return HomeBody();
    }
    else if(index ==1){
      return RankingsBody();
    }
    else if(index ==2){
      return FriendsBody();
    }
    else{
      return AccountBody();
    }
  }

  @override
  void initState() {
    super.initState();
    getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Gray,
        drawer: Drawer(
          backgroundColor: Gray,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(''),
              ),
              ListTile(
                title: Row(children: [Icon(Icons.settings,color: Red,),SizedBox(width: 15,),Text("Settings",style: TextStyle(fontSize: 18),)],),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(children: [Icon(Icons.logout,color: Red,),SizedBox(width: 15,),Text("Logout",style: TextStyle(fontSize: 18),)],),
                onTap: () {
                  // Drawer log out function
                  FirebaseAuth.instance.signOut().whenComplete(() => Navigator.pushNamed(context, AuthenticationScreen.id));

                },
              ),
              ListTile(
                title: Row(children: [Icon(Icons.info,color: Red,),SizedBox(width: 15,),Text("About",style: TextStyle(fontSize: 18),)],),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(children: [Icon(Icons.person,color: Red,),SizedBox(width: 15,),Text("Wallet",style: TextStyle(fontSize: 18),)],),
                onTap: () {
                  // Update the state of the app.
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet()));
                  // ...
                },
              ),
            ],
          ),
        ),

        appBar: AppBar(
          title: const Text("Health"),
          iconTheme: IconThemeData(color: DarkGray),
          actions: [
            FlatButton(child: CircleAvatar(backgroundColor: Red,radius: 13,child: Text("$coins"),),onPressed: (){
              launchURL();
            },),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, ChatScreen.id);
            },
                icon: Icon(Icons.message_rounded))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart),
              label: 'Rankings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(backgroundColor : Colors.red,radius: 13,child: Icon(Icons.person,size: 18,),),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: DarkGray,
          selectedItemColor: Red,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

        ),

        body: selectBody(_selectedIndex),
      ),
    );

  }
}
