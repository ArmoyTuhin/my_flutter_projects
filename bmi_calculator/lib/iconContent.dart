import 'package:bmi_calculator/second.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class CardContent extends StatelessWidget {
  CardContent({@required this.icon,this.textCard});

  final String textCard;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(icon,
          size: 80.0,),
        SizedBox(height: 15.0,),
        Text(textCard,style:labelTextStyle ,
        ),
      ],
    );
  }
}
