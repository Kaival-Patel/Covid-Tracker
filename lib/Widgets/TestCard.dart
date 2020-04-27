import 'package:covid_19/Widgets/HelpAlertBox.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constants.dart';
class TestCard extends StatelessWidget {
  String bodytext,title,pathToAsset;
  TestCard({this.bodytext,this.title,this.pathToAsset});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Positioned(
          child: Container(
                    height: screenheight*0.2,
                    width: screenwidth*1,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                    child: Text(title,style: cust_bodyTextStyle.copyWith(color:cust_backgroundColor,fontSize:20,fontWeight: FontWeight.w700),),
                  ),
                ),
        ),
        Positioned(
          top:25,
          child: Container(
                    height: screenheight*0.3,
                    width: screenwidth*0.7,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                    child: Text(bodytext,style: cust_bodyTextStyle.copyWith(color:cust_backgroundColor,fontSize:12,),),
                  ),
                ),
        ),
        Positioned(
          top:80,
          left:20 ,
          child: FlatButton(
            child: Text("Test Now",style: TextStyle(color: Colors.white),),
            color: cust_backgroundColor,
            onPressed: (){
              showDialog(context: context,child:HelpAlertBox());
            },
          )
        ),
        
      ],
      
    );
  }
}