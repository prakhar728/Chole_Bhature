import 'package:cholebhature/data/user_data.dart';
import 'package:cholebhature/theme/colors.dart';
import 'package:cholebhature/widgets/progress_report.dart';
import 'package:flutter/material.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: FlatButton(child: CircleAvatar(radius: double.infinity,backgroundColor: Red,
                      child: Icon(Icons.person,size: 65,),
                    ),
                      onPressed: (){
                        print("pressed");
                      },
                    ),
                      flex: 1,
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${name}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text("<${userEmail}>",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300)),
                            Text("${height} cms, ${weight} kgs",style: const TextStyle(fontSize: 20,)),
                            Text("Age : ${age}",style: const TextStyle(fontSize: 20,)),
                          ],
                          ),
                        ),
                    ),
                      flex: 2,
                    )
                  ],
                ),
              ),
            )
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("progress",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
        Expanded(child: Container(
          child: Progress(email: userEmail,),
        ), flex: 2,),
      ],
    );
  }
}
