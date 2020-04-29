import 'package:flutter/material.dart';
import 'package:covid_19/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class DeveloperInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
  double screenwidth = MediaQuery.of(context).size.width;
    return Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Positioned(
                  top: 10,
                  child: Container(
                    height: screenheight*0.2,
                    width: screenwidth*0.5,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: Text("About Developer",maxLines: 1,style: cust_bodyTextStyle.copyWith(color:Colors.white,fontSize:20,fontWeight: FontWeight.w700),),
                  ),
                ),
              ),
              Positioned(
                  top: 50,
                  child: Container(
                    height: screenheight*1,
                    width: screenwidth*0.6,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: Text("Hey, I am Kaival Patel who loves to write the code and develop new Apps !",maxLines: 4,style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                  ),
                ),
              ),
              
              Positioned(
                  left: screenwidth*0.6+5,
                  top:20,
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: CircleAvatar(
                      backgroundColor:Colors.blue,
                      backgroundImage: AssetImage("assets/img/developer.png"),
                      maxRadius: 60,
                    )
                  ),
                ),
              ),
             
              
            ],
          );
  }
  
}