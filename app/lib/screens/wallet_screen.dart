
import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: DarkGray),
        title: Text("Wallet"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Add wallet adress",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (str){
                address = str;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: MaterialButton(
              onPressed: (){
                FirebaseFirestore.instance.collection("users").doc(userEmail).update({
                  "address" : address,
                }).then((value){
                  walletAdress = address;
                  getCoins();
                }).then((value) {Navigator.pop(context);});
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Red,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text("Submit",style: TextStyle(fontSize: 20),)),
              ),
            ),
          )

        ],
      ),
    );
  }
}
