import 'dart:collection';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_19/Widgets/Statisticsbox.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import '../datamodel/Corona.dart';
class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  String dataURL="https://covidapi.info/api/v1/country/IND/timeseries/";
  DateTime date=DateTime.now();
  String startdate,enddate;
  bool isLoading=false;
  int totalcount=0;
  List data;
  List<Corona>confirmedList,recoveredList,deadList;
  List<charts.Series<Corona,int>> _seriesLineData,_seriesDummyData;
  
  @override
  void initState() {
    super.initState();
    confirmedList=List<Corona>();
    recoveredList=List<Corona>();
    deadList=List<Corona>();
    _seriesLineData=List<charts.Series<Corona,int>>();
    _seriesDummyData=List<charts.Series<Corona,int>>();
    setState(() {
      isLoading=true;
      startdate=date.subtract(Duration(days: 8)).toIso8601String();
      enddate=date.subtract(Duration(days: 1)).toIso8601String();
      startdate=startdate.substring(0,10);
      enddate=enddate.substring(0,10);

      confirmedList.add(Corona(0,0));
      confirmedList.add(Corona(1,1));
      confirmedList.add(Corona(2,2));
      confirmedList.add(Corona(3,3));
      confirmedList.add(Corona(4,4));
      confirmedList.add(Corona(5,5));
      confirmedList.add(Corona(6,6));


      recoveredList.add(Corona(0,0));
      recoveredList.add(Corona(1,1));
      recoveredList.add(Corona(2,2));
      recoveredList.add(Corona(3,3));
      recoveredList.add(Corona(4,4));
      recoveredList.add(Corona(5,5));
      recoveredList.add(Corona(6,6));

      deadList.add(Corona(0,0));
      deadList.add(Corona(1,1));
      deadList.add(Corona(2,2));
      deadList.add(Corona(3,3));
      deadList.add(Corona(4,4));
      deadList.add(Corona(5,5));
      deadList.add(Corona(6,6));



      _seriesDummyData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data:confirmedList,
        domainFn: (Corona corona, _) => corona.dateval,
        measureFn: (Corona corona, _) => corona.cases,
        labelAccessorFn: (Corona corona,_)=>'${corona.cases}'
      ),
      );
    _seriesDummyData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data:recoveredList,
        domainFn: (Corona corona, _) => corona.dateval,
        measureFn: (Corona corona, _) => corona.cases,
      ),
    );
    
    _seriesDummyData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: deadList,
        domainFn: (Corona corona, _) => corona.dateval,
        measureFn: (Corona corona, _) => corona.cases,
      ),
    );




      });
    
    this.generateData();
    
    }

  void setData(){
    setState(() {
      confirmedList.clear();
      recoveredList.clear();
      deadList.clear();
      confirmedList.add(Corona(0,0));
      recoveredList.add(Corona(0,0));
      deadList.add(Corona(0,0));
      for(int i=0;i<totalcount;i++){
      print(data[i]['confirmed']);
      print(data[i]['recovered']);
      print(data[i]['deaths']);
      confirmedList.add(Corona(i+1,data[i]['confirmed']));
      recoveredList.add(Corona(i+1,data[i]['recovered']));
      deadList.add(Corona(i+1,data[i]['deaths']));
      }
      _seriesLineData.clear();
      _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.blue),
        id: 'Air Pollution',
        data:confirmedList,
        domainFn: (Corona corona, _) => corona.dateval,
        measureFn: (Corona corona, _) => corona.cases,
        labelAccessorFn: (Corona corona,_)=>'${corona.cases}'
      ),
      );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.green[900]),
        id: 'Air Pollution',
        data:recoveredList,
        domainFn: (Corona corona, _) => corona.dateval,
        measureFn: (Corona corona, _) => corona.cases,
      ),
    );
    
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.red[900]),
        id: 'Air Pollution',
        data: deadList,
        domainFn: (Corona corona, _) => corona.dateval,
        measureFn: (Corona corona, _) => corona.cases,
      ),
    );

    });
      
    print("CONFIRMED LENGTH:");
    print(confirmedList.length);
    
    

  }
  

  Future<String> generateData() async{
    var response = await http.get(
      Uri.encodeFull(dataURL+"$startdate"+"/"+"$enddate")
    );
    setState(() {
      var convertToJson= json.decode(response.body);
      totalcount=convertToJson['count'];
      data=convertToJson['result'];
      print(data);
      isLoading=false;
      setData();
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
                      child: Text("Past 7 days Data (India)",style: cust_TitleTextStyle.copyWith(color: themeMode=="light"?cust_darktheme:cust_lighttheme),),
                    ),
                    
                  ],
                ),

                Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.blue,
                                ),
                                Text("  Confirmed",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.green,
                                ),
                                Text("  Recovered",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.red,
                                ),
                                Text("  Deaths",style: TextStyle(color: themeMode=="light"?cust_darktheme:cust_lighttheme),)
                              ],
                            ),
                          )
                        ],
                      )
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          visible: isLoading?true:false,
                          child: CircularProgressIndicator(
                            backgroundColor: cust_backgroundColor,
                          ),
                        ),
                        Expanded(
                          child:charts.LineChart(
                            isLoading?_seriesDummyData:_seriesLineData, 
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 1),
                            behaviors: [
                              new charts.ChartTitle('Days',
                                  behaviorPosition: charts.BehaviorPosition.bottom,
                                  titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                              new charts.ChartTitle('Cases',
                                  behaviorPosition: charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                  
                                ]
                              ),
                            ),
                        
                        ],
                    ),
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
