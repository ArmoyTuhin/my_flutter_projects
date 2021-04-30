import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  File _image ;
  final picker = ImagePicker();
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  int _value =1;


  Future cameraImage () async{
  final pickedFile = await picker.getImage(source: ImageSource.camera);

  setState(() {

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text("Sign Up"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children:<Widget>[

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
                              labelText: 'Designation',
                              hintText: 'Enter Your Designation',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Team",style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          fontSize: 20), ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        height:70,
                        width: 150,
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Tech"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Business"),
                                value: 2,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),//DropDown
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}
