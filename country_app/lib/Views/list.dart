import 'package:country_app/Country/bangladesh.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';

class countryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[750],
          title: Text("Countries"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: _countries.length,
              itemBuilder: (context, index) {
                final country = _countries[index];
                return ExpansionTile(
                  title: ListTile(
                    title: Text(country.countryName),
                  ),
                  children: <Widget>[
                    Container(
                      height: 150,
                      color: Colors.blueGrey,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              country.countryInfo,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          RaisedButton(
                            child: Text(
                              "See More",
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bangladesh(
                                        country.countryName,
                                        country.countryInfo)),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}

class Countries {
  Countries({this.countryName, this.countryInfo});
  String countryName, countryInfo;
}

final List<Countries> _countries = <Countries>[
  Countries(
      countryName: 'Bangladesh',
      countryInfo: 'Bangladesh is a country in South Asia.'),
  Countries(
      countryName: 'India', countryInfo: 'India is a country in South Asia.'),
  Countries(
      countryName: 'Australia',
      countryInfo: 'Australia is a country in Australia'),
  Countries(
      countryName: 'Srilanka',
      countryInfo: 'Srilanka is a country in South Asia.')
];
