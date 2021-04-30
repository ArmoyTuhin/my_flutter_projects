import 'package:bmi_calculator/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/iconContent.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/resultsPage.dart';
import 'package:bmi_calculator/calculation.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 20;
  int weight = 80;
  int age = 23;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? inactiveCardColour
                          : activeCardColour,
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.mars,
                        textCard: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? inactiveCardColour
                            : activeCardColour,
                        cardChild: CardContent(
                          icon: FontAwesomeIcons.venus,
                          textCard: "FEMALE",
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: activeCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Height",
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: heightStyle,
                    ),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 0,
                  max: 220.0,
                  activeColor: bottomContainerColour,
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: heightStyle,
                          ),
                          Text(
                            "kg",
                            style: labelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: heightStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBmi calculation = CalculateBmi(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    calcBmi: calculation.calculateBMI(),
                    bmiResult:calculation.getResult() ,
             bmiAdvice:calculation.getAdvice(),
                  ),
                ),
              );
            },
            child: Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 18.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(child: Text("CALCULATE", style: largeButton)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
