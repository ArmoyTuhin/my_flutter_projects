import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'Views.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  bool _hasBeenPressed = false;
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  FirebaseDatabase fb = FirebaseDatabase.instance;

  Future cameraImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  } //using camera icon which takes picture

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      _image != null
                          ? Container(
                              width: 150,
                              height: 150,
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(_image),
                                  /*image: NetworkImage(
                                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),*/
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: 150,
                                height: 150,
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "No Image",
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        //give the values according to your requirement
                        child: InkWell(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 35,
                            color: Colors.deepOrangeAccent,
                          ),
                          onTap: () {
                            cameraImage();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: _namecontroller,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter Your Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          autofocus: false,
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            hintText: 'Enter Your Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Container(
                height: 60,
                width: 170,
                child: NormalRaisedButton(
                    savedata(_namecontroller.text, _emailcontroller.text),
                    "Update",
                    mColor: _hasBeenPressed ? Colors.white10 : Colors.white12),
              ),
            ],
          ),
        ),
      ),
    );
  }



  savedata(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("NAME", name);
    var nameDataFromSharedPref = prefs.getString("NAME");
    print("name from shared pref = $nameDataFromSharedPref");
    prefs.setString("EMAIL", email);
    Fluttertoast.showToast(msg: "Updated");
  }
}
