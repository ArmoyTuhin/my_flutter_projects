import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/second.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculation.dart';

class ResultsPage extends StatelessWidget {
  final  calcBmi;
  final  bmiResult;
  final  bmiAdvice;

  const ResultsPage({this.calcBmi, this.bmiResult, this.bmiAdvice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Expanded(
              child: Container(
                child: Text(
                  "Your Result",
                  style: resultTitleStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult.toString(),
                    style: resultsText,
                  ),
                  Text(
                    calcBmi,
                    style: bmiResultStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bmiAdvice.toString(),
                      style: bmiTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 18.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(child: Text("RE-CALCULATE", style: largeButton)),
            ),
          ),
        ],
      ),
    );
  }
}
