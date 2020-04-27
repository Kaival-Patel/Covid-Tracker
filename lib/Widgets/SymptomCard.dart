import 'package:flutter/material.dart';
import 'package:covid_19/constants.dart';
class SymptomCard extends StatelessWidget {
  //bodytext that appear in symptoms and path to new Image
  String bodytext, pathToAsset;
  SymptomCard({this.bodytext,this.pathToAsset});
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
                    child: Text("Symptoms",style: cust_bodyTextStyle.copyWith(color:Colors.white,fontSize:20,fontWeight: FontWeight.w700),),
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
                    child: Text(bodytext,style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                  ),
                ),
              ),
              Positioned(
                  left: screenwidth*0.6+10,
                  top:40,
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: CircleAvatar(
                      backgroundColor: cust_yellowishBackground,
                      maxRadius: 60,
                    )
                  ),
                ),
              ),
              Positioned(
                  left: screenwidth*0.6+10,
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image(
                      image: AssetImage(pathToAsset),
                      height: screenheight*0.1+100,
                      width: screenwidth*0.1+100,
                    )
                  ),
                ),
              ),
              
            ],
          );
  }
}