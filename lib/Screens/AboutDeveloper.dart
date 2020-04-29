import 'package:covid_19/Widgets/DeveloperInfo.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloper extends StatefulWidget {
  @override
  _AboutDeveloperState createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper> {
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
              child:DeveloperInfo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 550,
              width: screenwidth,
                decoration: BoxDecoration(
                color: cust_yellowishBackground,
                borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Follow me",style: cust_HeadingTextStyle.copyWith(color:cust_backgroundColor),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:FlatButton(
                              onPressed: (){
                                openPage("https://www.instagram.com/kaival.dart/");
                              },
                
                              child:Image(image: AssetImage("assets/socialbuttons/ig.png"),height: 60,width: 60,),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:FlatButton(
                              onPressed: (){
                                openPage("https://www.facebook.com/kaival.patel.395");
                              },
                
                              child:Image(image: AssetImage("assets/socialbuttons/fb.png"),height: 55,width: 55,),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:FlatButton(
                              onPressed: (){
                                openPage("https://twitter.com/KaivalP36380810");
                              },
                
                              child:Image(image: AssetImage("assets/socialbuttons/twitter.png"),height: 70,width: 70,),
                            )
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Reach me",style: cust_HeadingTextStyle.copyWith(color:cust_backgroundColor),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:Tooltip(
                              message: "Mail : kaivalpatel53@gmail.com",
                              child: GestureDetector(
                                onTap: (){openPage("https://mailto:kaivalpatel53@gmail.com");},
                                child: Align(
                                  alignment: Alignment.center,
                                    child: Container(
                                    height: 65,
                                    width: screenwidth*0.85,
                                    decoration: BoxDecoration(
                                      color: Colors.red[300],
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: AssetImage("assets/socialbuttons/gmail.png"),height: 70,width: 70,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Say hello....",style: TextStyle(fontSize: 25,color: Colors.white),),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ),
                          
                          
                        
                          
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("My Repo",style: cust_HeadingTextStyle.copyWith(color:cust_backgroundColor),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:Tooltip(
                              message: "Github:github.com/Kaival-Patel",
                              child: GestureDetector(
                                onTap: (){openPage("https://github.com/Kaival-Patel");},
                                child: Align(
                                  alignment: Alignment.center,
                                    child: Container(
                                    height: 60,
                                    width: screenwidth*0.85,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(image: AssetImage("assets/socialbuttons/github.png"),height: 70,width: 70,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Go to Repo",style: TextStyle(fontSize: 25,color: Colors.black),),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ),
                          
                          
                        
                          
                        ],
                      ),
                    ),      
                    
                  ],
                ),
              ),
          ),
        ],
      ),
      
    );
  }
  openPage(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Cannot Launch Page';
    }
  }
}