import 'package:country_app/Views/list.dart';
import 'package:flutter/material.dart';
import 'package:country_app/districtsDescription.dart';

import '../districts.dart';


class Bangladesh extends StatelessWidget {
  final String countryName,countryInfo;
  Bangladesh(this.countryName, this.countryInfo);


List districts , districtDescriptionData;


  @override
  Widget build(BuildContext context) {

var position = 0;
    if(countryName.contains("Bangladesh")) {districts = DistrictList.bdDistrict;position=0;}
    if(countryName.contains("India")) {districts = DistrictList.indiaDistrict;position=1;}
    if(countryName.contains("Australia")) {districts = DistrictList.australiaDistrict;position=2;}
    if(countryName.contains("Srilanka")) {districts = DistrictList.srilankaDistrict;position=3;}




    districtDescriptionData = DistrictList.districtDescription;
     print("${districtDescriptionData[2]} ggggggggg");


    return Scaffold(
      appBar: AppBar(title: Text(countryName),),
      body: SingleChildScrollView(
        child: Column(

          children: [

            Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(countryName,style: TextStyle(fontSize: 30),),
              ),
            ),
            Text("Districts",style: TextStyle(fontSize: 20),),

            Container(
            height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: districts.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: ListTile(
                        title: Text(districts[index]),
                      ),
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height*0.2,
                          color: Colors.indigoAccent,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text( districtDescriptionData[position][districts[index]]??"null in index $index",
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


class bd{

  var map =
  {
    'Bangladesh' : 'The region of Chittagong is traditionally centred around its seaport which has existed since ancient times. The region was home to the ancient independent Buddhist kingdoms of Samatata and Harikela.',
    'Srilanka': 'Sri Lankas documented history spans 3,000 years, with evidence of prehistoric human settlements dating back at least 125,000 years.',
    'India':'India (Hindi: Bhārat), officially the Republic of India (Hindi: Bhārat Gaṇarājya),[23] is a country in South Asia.',
    'Australia':'Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.'
  };

}
