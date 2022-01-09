import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/utill/functions.dart';
import 'package:cholebhature/widgets/calories_burnt.dart';
import 'package:cholebhature/widgets/exercises.dart';
import 'package:cholebhature/widgets/genric_card.dart';
import 'package:cholebhature/widgets/percentile_card.dart';
import 'package:cholebhature/widgets/steps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';
  int _calories = 0;
  var todayRef = FirebaseFirestore.instance.collection("users").doc(userEmail).collection("data").doc((today).toString());

  @override
  void initState() {
    today = getoday();
    getFitData();
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    today = getoday();
    print(event);
    setState(() {
      _steps = event.steps.toString();
      if(int.parse(_steps)<yesterdaySteps){
        yesterdaySteps =0;
      }
      todaySteps = int.parse(_steps)-yesterdaySteps;
      _calories = (todaySteps*0.2).round();
      calories = _calories;

      if(lastReward!= today && todaySteps>=6000){
        awardCoins();
        lastReward = today;
      }
    });
    todayRef.set({
      "steps" : todaySteps,
      "calories" : calories,
      "date" : today,
    });
    FirebaseFirestore.instance.collection("users").doc(userEmail).update({
      "today" : todaySteps
    });

    rank  = (5-(todaySteps/3600)).toString();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
          child: Align(child: Text("Hii, ${name}",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: DarkGray),textAlign: TextAlign.start,),alignment: Alignment.topLeft,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Align(child: Text("let's check your progress",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: DarkGray),textAlign: TextAlign.start,),alignment: Alignment.topLeft,),
        ),
        Expanded(
          flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: StepsCard(steps: todaySteps.toDouble(),),
                    )),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Calories(calories: calories.toString(),),
                          )),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: PercentileCard(percentile: 95+(todaySteps/3600),),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
        Expanded(
          flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Exercises(exercise: "Warm up",   index: 1)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Green,
                          ),
                          height: double.infinity,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Warm up", style: TextStyle(fontSize: 20),),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image(image: AssetImage("assets/warmup.jpg"),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Exercises(exercise: "Callisthenics",   index: 2)));},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Green,
                          ),
                          height: double.infinity,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Callistenics", style: TextStyle(fontSize: 20),),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image(image: AssetImage("assets/callisthenics.jpg"),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Exercises(exercise: "Yoga",   index: 3)));},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Green,
                          ),
                          height: double.infinity,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Yoga", style: TextStyle(fontSize: 20),),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image(image: AssetImage("assets/yoga.jpg"),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120,)
              ],
            )
        )
      ],
    );
  }
}
