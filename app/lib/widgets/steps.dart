import 'package:cholebhature/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StepsCard extends StatefulWidget {
  double steps;


  StepsCard({required this.steps});

  @override
  _StepsCardState createState() => _StepsCardState();
}

class _StepsCardState extends State<StepsCard> {

  @override
  Widget build(BuildContext context) {
    double achieved = widget.steps;
    double target = 6000;
    double goal = target>achieved ? target-achieved : 0;
    Map<String, double> dataMap = {
      "achieved": achieved,
      "goal": goal,
    };

    final ColorList = <Color>[Red,Gray];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
            child: Text('👟 steps',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: DarkGray)),
          ),
          SizedBox(height: 38,),
          Expanded(
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 3,
              initialAngleInDegree: -90,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              centerText: "${achieved.toInt()} /\n${target.toInt()}",
              centerTextStyle: TextStyle(fontSize: 18,color: DarkGray,fontWeight: FontWeight.bold),
              colorList: ColorList,
              legendOptions: const LegendOptions(
                showLegends: false,
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: false,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
              ),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),
          ),
          SizedBox(height: 12,)
        ],
      ),
    );
  }
}
