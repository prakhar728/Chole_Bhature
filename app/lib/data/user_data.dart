import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

late String userEmail;
late String name;
late String age;
late String height;
late String weight;
late String password;
late DocumentSnapshot snapshot;
late int today;
late int todaySteps =0;
late int yesterdaySteps=0;
int calories =0;
String rank = "5";
var yesterdayData = FirebaseFirestore.instance.collection("users").doc(userEmail).collection("data").doc((today-1).toString());
String balanceUrl = "https://cholebhature.herokuapp.com/balanceOf";
String walletAdress = "";
Map temp = {"userAddress": walletAdress};
int coins = 0;
int lastReward = 0;

Future<void> getData() async {
    userEmail = FirebaseAuth.instance.currentUser!.email.toString();
    final value = await FirebaseFirestore.instance.collection('users').doc(userEmail).get();
    snapshot = value;
    age = value['age'].toString();
    name = value['name'].toString();
    height = value['height'].toString();
    weight = value['weight'].toString();
    walletAdress = value['address'].toString();
}

void getFitData() async{
    var getDoc = await yesterdayData.get().then((docData)  {
        if(docData.exists){
            yesterdaySteps = docData["steps"];
        }
        else{
            yesterdaySteps =0;
            print("------------------------------------no previous data found");
        }
    });
}


String DateDecoder(int date){
    String s1;
    s1 = (date%100).toString();
    s1 += "/";
    date-= (date%100);
    date = (date/100).round();
    s1 += (date%100).toString();
    return s1;
}

String truncate(String text, { length: 7, omission: '' }) {
    if (length >= text.length) {
        return text;
    }
    return text.replaceRange(length, text.length, omission);
}

void getCoins() async{
    var key = {"userAddress":walletAdress};
    Response response = await Dio().post(balanceUrl,
        options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(key),
    );
    coins = int.parse(response.data);
    print(coins);
}


void awardCoins() async{
    var key = {
        "numberofToken":"1",
        "userAddress":walletAdress
    };
    Response response = await Dio().post("https://cholebhature.herokuapp.com/awardCoin",
        options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(key),
    );
}

void launchURL() async {
    if (!await launch("https://cholebhaturewallet.herokuapp.com/")) throw 'Could not launch https://cholebhaturewallet.herokuapp.com/';
}