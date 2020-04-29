import 'dart:convert';

import 'package:covid_19/Widgets/Donationbox.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  String API_URL="https://api.rootnet.in/covid19-in/stats/latest";
  List data;
  bool isLoading=false;
  int count=1;
  @override
  void initState(){
    super.initState();
    data=List();
    setState(() {
      isLoading=true;
    });
    loadTable();
  }
  //
  /*[{loc: Andaman and Nicobar Islands, confirmedCasesIndian: 
33, discharged: 15, deaths: 0, confirmedCasesForeign: 0, totalConfirmed: 33}, {loc: Andhra Pradesh, confirmedCasesIndian: 1259, 
discharged: 258, deaths: 31, confirmedCasesForeign: 0, totalConfirmed: 1259}, {loc: Arunachal Pradesh, confirmedCasesIndian: 1, 
discharged: 1, deaths: 0, confirmedCasesForeign: 0, totalConfirmed: 1}, {loc: Assam, confirmedCasesIndian: 38, discharged: 27, deaths: 1, confirmedCasesForeign: 0, totalConfirmed: 38}, {loc: Bihar, confirmedCasesIndian: 366, discharged: 64, deaths: 2, confirmedCasesForeign: 0, totalConfirmed: 366}, {loc: Chandigarh, confirmedCasesIndian: 56, discharged: 17, deaths: 0, confirmedCasesForeign: 0, totalConfirmed: 56}, {loc: Chhattisgarh, confirmedCasesIndian: 38, discharged: 34, deaths: 0, confirmedCasesForeign: 0, totalConfirmed: 38}, {loc: Delhi, confirmedCasesIndian: 3313, discharged: 1078, deaths: 54, confirmedCasesForeign: 1, totalConfirmed: 3314}, {loc: Goa, confirmedCasesIndian: 6, discharged: 7,}] */











  Future<String> loadTable() async{
    var response=await http.get(
      Uri.encodeFull(API_URL)
    );
    setState(() {
      var covertToJson= json.decode(response.body);
      data.clear();
      data=covertToJson['data']['regional'];
      isLoading=false;
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
            child: Container(
              height: screenheight*0.27,
              width: screenwidth*1,
              decoration: BoxDecoration(
              color: cust_backgroundColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
              ),
              child:Donationbox(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading? CircularProgressIndicator(backgroundColor: cust_backgroundColor,semanticsLabel: "Loading States data...",) 
            :DataTable(
              columnSpacing: 5.0,
              horizontalMargin: 2.0,
              columns: [
                DataColumn(label: Text("State",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                DataColumn(label: Text("Confirmed",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                DataColumn(label: Text("Discharged",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                DataColumn(label: Text("Deaths",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
              ],
              rows:
              
              data.map((element)=>
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(element['loc'],style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                  DataCell(Text(element['totalConfirmed'].toString(),style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                  DataCell(Text(element['discharged'].toString(),style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                  DataCell(Text(element['deaths'].toString(),style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)),
                ]
              )
              ).toList(),
            )
          )

        ],
      ),
      
    );
  }
}