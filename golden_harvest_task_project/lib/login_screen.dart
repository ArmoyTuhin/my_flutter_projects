import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Padding(padding: const EdgeInsets.all(30),
      child: Center (
        child: SingleChildScrollView (
          child: Column (
            children: [
              Image.asset("images/group.png"),
            ],
          ),

        ),
      )
      );
  }

}