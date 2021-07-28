import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/painting.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:  Homepage(),
    ) ;

  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  BouncingScrollPhysics _bouncingScrollPhysics = BouncingScrollPhysics();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List applists= [];
    changingicon(index) {
      if (applists[index].packageName ==
          "com.whatsapp") {
        return Image.asset("assets/images/dialer.png",fit: BoxFit.cover,);
      }  else {
        return Image.memory((applists[index] as ApplicationWithIcon).icon,
          width: 40,);
      }
    }


    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Container(
              height: size.height,
              width: size.width,
              child: Image.asset("assets/images/back.jpeg", fit: BoxFit.cover, ),

            ),


            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Container(
                child: PageView(
                  children: [
                    FutureBuilder(
                      future: DeviceApps.getInstalledApplications(
                        includeAppIcons: true,
                        includeSystemApps: true,
                        onlyAppsWithLaunchIntent: true,
                      ),
                        builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.done)
                      {
                        List<Application> allApps = snapshot.data as List<Application>;
                        applists =allApps;
                        print(applists.length);


                        return GridView.count(
                            crossAxisCount: 3,
                            padding: EdgeInsets.only(
                              top: 40.00,
                            ),
                            children: List.generate(allApps.length, (index) {
                              return GestureDetector(
                                onTap: (){
                                  print(allApps[index].packageName);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                    child: changingicon(index),
                                    height: 40,
                                    width: 40,),
                                    Center(
                                      child: Text("${allApps[index].appName}",

                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],

                                ),
                              );
                           }
                          ),
                        );
                      }

                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),

                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: GlassContainer.frostedGlass(
                      height: size.height,
                      width: size.width * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              DeviceApps.openApp(applists[43].packageName);
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/dialer.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
//                          Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Image.asset(
//                                "images/playstore3.png",
//                                fit: BoxFit.cover,
//                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}
