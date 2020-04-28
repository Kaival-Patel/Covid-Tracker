import 'dart:convert';

import 'package:covid_19/Widgets/Statisticsbox.dart';
import 'package:covid_19/Widgets/SymptomCard.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import '../datamodel/Corona.dart';
import 'package:intl/intl.dart';
class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  String dataURL="https://covidapi.info/api/v1/country/IND/timeseries/";
  DateTime date=DateTime.now();
  String startdate,enddate;
  
  @override
  void initState(){
    super.initState();
    setState(() {
      startdate=date.subtract(Duration(days: 8)).toIso8601String();
      enddate=date.subtract(Duration(days: 1)).toIso8601String();
      startdate=startdate.substring(0,10);
      enddate=enddate.substring(0,10);
      print(startdate);
      print(enddate);
    });
    generateData();
  }
  

  Future<String> generateData() async{
    var response = await http.get(
      Uri.encodeFull(dataURL+"$startdate"+"/"+"$enddate")
    );
    setState(() {
      var convertToJson= json.decode(response.body);
      print("JSON COUNT:=>");
      print(convertToJson['count']);
    });
  }



  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container( 
            child: SizedBox(
              height: screenheight,
              width: screenwidth*1,
              child: Statisticsbox()
            ),
            //height consist of 30% of the remaning screen 
            height: screenheight*0.5,
            width: screenwidth*1,
            decoration: BoxDecoration(
              color: cust_backgroundColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
            ),
          ),
          Container(
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Past 7 days Data (India)",style: cust_TitleTextStyle,),
                    ),
                    
                  ],
                ),

                // Align(
                //       alignment: Alignment.centerRight,
                //       child: Row(
                //         children: <Widget>[
                //           Pad
                //         ],
                //       )
                // )

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    child: Container(),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
