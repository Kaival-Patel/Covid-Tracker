import 'dart:convert';

import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class Statisticsbox extends StatefulWidget {
  
  @override
  _StatisticsboxState createState() => _StatisticsboxState();
}

class _StatisticsboxState extends State<Statisticsbox> {
  int india_totalcases=0,india_activecases=0,india_recoveredcases=0,india_deaths=0;
  int global_totalcases=0,global_death=0,global_recovered=0;
  final String INDIA_CORONA_STATUS_URL="https://api.rootnet.in/covid19-in/stats/latest";
  final String GLOBAL_CORONA_STATUS_URL="https://coronavirus-19-api.herokuapp.com/all";
  List IndianData,GlobalData;
  bool isLoading=false;

  @override
  void initState(){
    super.initState();
    setState(() {
      isLoading=true;
    });
    fetchIndiaCoronaStatus();
    fetchGlobalCoronaStatus();
  }

  Future<String> fetchIndiaCoronaStatus() async{
    var response=await http.get(
      Uri.encodeFull(INDIA_CORONA_STATUS_URL)
    );
    setState(() {
      var convertDataToJson= json.decode(response.body);
      IndianData=convertDataToJson["data"]["unofficial-summary"];
      if(IndianData!=null){
        setState(() {
          isLoading=false;
          india_totalcases=IndianData[0]['total'];
          india_activecases=IndianData[0]['active'];
          india_deaths=IndianData[0]['deaths'];
          india_recoveredcases=IndianData[0]['recovered'];
          print(india_totalcases);
          print(india_activecases);
          print(india_deaths);
          print(india_recoveredcases);
        });
      }

      print(IndianData.length);
    });

  }
  Future<String> fetchGlobalCoronaStatus() async{
    var response=await http.get(
      Uri.encodeFull(GLOBAL_CORONA_STATUS_URL)
    );
    setState(() {
      var convertDataToJson= json.decode(response.body);
      if(convertDataToJson!=null){
        setState(() {
          isLoading=false;
          global_totalcases=convertDataToJson['cases'];
          global_death=convertDataToJson['deaths'];
          global_recovered=convertDataToJson['recovered'];
        });
      }

      print(IndianData.length);
    });

  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor:themeMode=="light"?cust_lighttheme:cust_darktheme,
          appBar: PreferredSize(
            child: Container(
              height:screenheight,
              color:cust_backgroundColor,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment:Alignment.centerLeft,
                    child:Padding(
                      padding: const EdgeInsets.fromLTRB(22, 10, 0, 12),
                      child: Text("Statistics",style: cust_TitleTextStyle.copyWith(fontSize: 30,color: Colors.white),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom:20.0),),
                  Container(
                      height: 50,
                      width: screenwidth*0.8,
                      decoration: BoxDecoration(
                        color: Color(0xff7F6FC8),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8, 8, 8),
                        child: TabBar(
                        labelColor: cust_backgroundColor,
                        unselectedLabelColor: Colors.white,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("India",),
                            ),  
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Global",),
                            ),
                          ),
                        ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5),),
                    Visibility(
                        visible: isLoading?true:false,
                        child: CircularProgressIndicator(
                          backgroundColor: cust_backgroundColor,
                        ),
                      ),
                    Visibility(
                        visible: isLoading?false:true,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
                            child: Text("Today",style: cust_TitleTextStyle.copyWith(color: Color(0xff7F6FC8)),),
                          ),
                        ),
                      ),  
                  
                ],
              ),
            ), 
            preferredSize:Size.fromHeight(screenheight*0.2)
          ),
          body: Container(
            decoration: BoxDecoration(
                 color: cust_backgroundColor,
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
            child: TabBarView(
              children: <Widget>[
                //India Tab
                 Column(
                    children: <Widget>[
                      
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:EdgeInsets.fromLTRB(30, 10, 10, 5),
                            child: Container(
                              height:80,
                              width: screenwidth*0.4,
                              decoration: BoxDecoration(
                                color: Color(0xff37B3C6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Total Cases",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$india_totalcases",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 12, 20, 5),
                            child: Container(
                              height:80,
                              width: screenwidth*0.4,
                              decoration: BoxDecoration(
                                color: Colors.yellow[800],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Active Cases",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$india_activecases",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                            child: Container(
                              height:80,
                              width: screenwidth*0.4,
                              decoration: BoxDecoration(
                                color: Colors.green[700],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Recovered Cases",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$india_recoveredcases",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                            child: Container(
                              height:80,
                              width: screenwidth*0.4,
                              decoration: BoxDecoration(
                                color: Colors.red[700],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Deaths",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$india_deaths",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),





                //Global Tab
                Column(
                    children: <Widget>[
                      
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:EdgeInsets.fromLTRB(30, 10, 10, 5),
                            child: Container(
                              height:80,
                              width: screenwidth*0.85,
                              decoration: BoxDecoration(
                                color: Color(0xff37B3C6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Total Cases",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$global_totalcases",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                            child: Container(
                              height:80,
                              width: screenwidth*0.4,
                              decoration: BoxDecoration(
                                color: Colors.green[700],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Recovered Cases",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$global_recovered",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                            child: Container(
                              height:80,
                              width: screenwidth*0.4,
                              decoration: BoxDecoration(
                                color: Colors.red[700],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Text("Deaths",style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text("$global_death",style: cust_HeadingTextStyle.copyWith(color:Colors.white),),
                                    )
                                  ),
                                  
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              ],
            ),
          )
        )
      )
    );
  }
}

/*
TabBar(
             labelColor: cust_backgroundColor,
             unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("India",),
                  ),  
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Global",),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Text("India"),
              Text("Global")
            ],
          ),*/