import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('NAME');
  }

  Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('EMAIL');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ), //ImageContainer

                  FutureBuilder(
                    future: getName(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Text(
                        // snapshot.data!=null?snapshot.data:"Empty Name",
                        snapshot.data ?? "Empty Name",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  FutureBuilder(
                    future: getEmail(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Text(
                        //snapshot.data!=null?snapshot.data:"Empty Email",
                        snapshot.data ?? "Empty Email",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      );
                    },
                  ), //Nam//EmailText
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ), //Profile

          ListTile(
            leading: Icon(Icons.contact_phone),
            title: InkWell(
              onTap: () {
                launch("tel://01861286931");
              },
              child: Text(
                "Call",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ), //settings

          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
