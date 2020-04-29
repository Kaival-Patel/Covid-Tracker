import 'package:flutter/material.dart';
import 'package:covid_19/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class Donationbox extends StatelessWidget {
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
                    child: Text("PM Cares Fund",maxLines: 1,style: cust_bodyTextStyle.copyWith(color:Colors.white,fontSize:20,fontWeight: FontWeight.w700),),
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
                    child: Text("Your small contribution will make a big difference in fighting the pandemic.",maxLines: 4,style: cust_bodyTextStyle.copyWith(color:Colors.white),),
                  ),
                ),
              ),
              Positioned(
                  top: 130,
                  child: Container(
                    height: screenheight*0.1,
                    width: screenwidth*0.6,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child:InkWell(
                      child: Text("Learn more",style:TextStyle(fontWeight:FontWeight.w700,color:cust_yellowishBackground),),
                      onTap: openFundPage,
                    )
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

                      image: AssetImage("assets/svg/donation.png"),
                      height: screenheight*0.1+70,
                      width: screenwidth*0.1+70,
                    )
                  ),
                ),
              ),
              
            ],
          );
  }
  openFundPage() async {
    String url="https://www.bhimupi.org.in/donation-digitized-with-bhim-upi";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Cannot Launch Page';
    }
  }
}