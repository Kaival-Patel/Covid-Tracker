import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_19/Screens/AboutDeveloper.dart';
import 'package:covid_19/Screens/Reports.dart';
import 'package:covid_19/Screens/Statistics.dart';
import 'package:covid_19/Widgets/TestCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets/SymptomCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children=[
    Home(),
    Statistics(),
    Reports(),
    AboutDeveloper(),

  ];
  int _currentbottomPos=0;


  @override
  void initState(){
    super.initState();
    // setState(() {
    //   themeMode="light";
    // });
    // print("THEME:$themeMode");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: (){SystemNavigator.pop();},
          child: Scaffold(
        //AppBar
        backgroundColor:themeMode=="light"?cust_lighttheme:cust_darktheme,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: cust_backgroundColor,
          title: AutoSizeText("Covid-19 Tracker by Kaival",style: cust_TitleTextStyle,),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: GestureDetector(
                    //view my repo on github
                      onTap: (){
                        setState(() {
                          if(themeMode=="light"){
                            themeMode="dark";
                          }
                          else{
                            themeMode="light";
                          }
                          if(_currentbottomPos==0){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context)=>HomePage()
                            ));
                          }
                          else if(_currentbottomPos==1){
                            onBottomBarItemChanged(0);
                          }
                          else if(_currentbottomPos==2){
                            onBottomBarItemChanged(0);
                          }
                          else{
                            onBottomBarItemChanged(0);
                          }


            
                        });
                      },
                      child: CircleAvatar(
                      maxRadius: 17.0,
                      backgroundImage: themeMode=="light" ? AssetImage("assets/svg/moon.png"):AssetImage("assets/svg/sun.png"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: themeMode=="light"?cust_lighttheme:cust_darktheme
            ),
            child: BottomNavigationBar(
            onTap: onBottomBarItemChanged,
            currentIndex: _currentbottomPos,
            backgroundColor: Colors.black,
            showSelectedLabels: false,
            items:[
              BottomNavigationBarItem( 
                title: Text(""),
                icon: Icon(Icons.home,color: Colors.grey,),
                activeIcon: Icon(Icons.home,color:cust_backgroundColor,),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.assessment,color: Colors.grey,),
                activeIcon: Icon(Icons.assessment,color:cust_backgroundColor,),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.assignment,color: Colors.grey,),
                activeIcon: Icon(Icons.assignment,color:cust_backgroundColor,),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.person,color: Colors.grey,),
                activeIcon: Icon(Icons.person,color:cust_backgroundColor,),
              ),
              

            ] 
          ),
        ),

        body:_children[_currentbottomPos]
      ),
    );
  }

  //to change the body according to bottom nav bar
  void onBottomBarItemChanged(index){
    setState(() {
      _currentbottomPos=index;
    });
  }


}

//HOME
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  double screenheight = MediaQuery.of(context).size.height;
  double screenwidth = MediaQuery.of(context).size.width;
    return Column(
        children: <Widget>[
          Container( 
            child: SymptomCard(
              bodytext: "People may be sick with the virus for 1 to 14 days before developing symptoms",
              pathToAsset: "assets/svg/symptom.png",
            ),
            //height consist of 30% of the remaning screen 
            height: screenheight*0.27,
            width: screenwidth*1,
            decoration: BoxDecoration(
              color: cust_backgroundColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
            ),
          ),
          Container(
            height: screenheight*0.35,
            width: screenwidth * 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),




              //Prevention Section
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Prevention",style: cust_HeadingTextStyle.copyWith(color: themeMode=="light"?cust_darktheme:cust_lighttheme),),
                        
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom:10.0),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Image(image: AssetImage("assets/svg/home.png"),height: 50,width:50,),
                              Text("Stay At Home",style: cust_bodyTextStyle.copyWith(fontSize: 12,color:themeMode=="light"?cust_darktheme:cust_lighttheme),textAlign: TextAlign.center),
                              Padding(padding: EdgeInsets.only(top:25.0),),
                              Image(image: AssetImage("assets/svg/cough.png"),height: 50,width:50,),
                              Text("Cover Coughs\nand sneezes",style: cust_bodyTextStyle.copyWith(fontSize: 12,color: themeMode=="light"?cust_darktheme:cust_lighttheme),textAlign: TextAlign.center)
                                  
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Image(image: AssetImage("assets/svg/distance.png"),height: 50,width:50,),
                              Text("Keep a Safe \n  Distance",style: cust_bodyTextStyle.copyWith(fontSize: 12,color: themeMode=="light"?cust_darktheme:cust_lighttheme),textAlign: TextAlign.center),
                              Padding(padding: EdgeInsets.only(top:5.0),),
                              Image(image: AssetImage("assets/svg/mask.png"),height: 50,width:50,),
                              Text("Wear facemask\nif you are sick",style: cust_bodyTextStyle.copyWith(fontSize: 12,color: themeMode=="light"?cust_darktheme:cust_lighttheme),textAlign: TextAlign.center)
                                
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Image(image: AssetImage("assets/svg/hands.png"),height: 50,width:50,),
                              Text("Wash hands\noften",style: cust_bodyTextStyle.copyWith(fontSize: 12,color: themeMode=="light"?cust_darktheme:cust_lighttheme),textAlign: TextAlign.center),
                              Padding(padding: EdgeInsets.only(top:5.0),),
                              Image(image: AssetImage("assets/svg/clean.png"),height: 50,width:50,),
                              Text("Clean and\ndisinfect",style: cust_bodyTextStyle.copyWith(fontSize: 12,color: themeMode=="light"?cust_darktheme:cust_lighttheme),textAlign: TextAlign.center)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Prevention Section Ends



            ),
          ),

          //Test Card
          Expanded(
              child: Stack(
                children: <Widget>[
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 160, 
                  width: screenwidth*1.0,
                  decoration: BoxDecoration(
                    color: cust_yellowishBackground,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child:TestCard(
                    bodytext:"There are lab tests that can identify the virus that cause COVID-19 in respiratory system" ,
                    pathToAsset: "assets/svg/doctor.png",
                    title:"Need to test Covid-19"
                      ),
                    ),
                  ),
                  Positioned(
                  left: screenwidth*0.6+10,
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                     child: Image(
                      image: AssetImage("assets/svg/virus.png"),
                      height: screenheight*0.1+15,
                      width: screenwidth*0.1+15,
                      )
                    ),
                  ),
                ),  
                  Positioned(
                  left: screenwidth*0.6+25,
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                     child: Image(
                      image: AssetImage("assets/svg/doctor.png"),
                      height: screenheight*0.1+55,
                      width: screenwidth*0.1+50,
                      )
                    ),
                  ),
                ),

                ],
              ),
          ),
          //Test Card Ends





        ],
      );
  }
}
