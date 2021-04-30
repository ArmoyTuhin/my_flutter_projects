import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hello_world/settings.dart';
import 'package:hello_world/drawe.dart';
import 'package:hello_world/homePage.dart';
import 'package:hello_world/profile.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Home.dart';

void main() {
  runApp(MaterialApp(
    title: "MyApp",
    //home: HomePage(),
    routes: {
   '/':(_) => HomePage(),
    '/profile':(_) => Profile(),
      '/settings':(_) => Settings(),

    },
  ));
}


