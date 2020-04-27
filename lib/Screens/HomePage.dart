import 'package:covid_19/Widgets/TestCard.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import '../Widgets/SymptomCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children=[
    Home(),
    Text("Statistics"),
    Text("Reports"),
    Text("Developer Profile")
  ];
  int _currentbottomPos=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: cust_backgroundColor,
        title: Text("Covid-19 Tracker by Kaival",style: cust_TitleTextStyle,),
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(7.0),
                child: GestureDetector(
                  //view my repo on github
                    onTap: (){},
                    child: CircleAvatar(
                    maxRadius: 17.0,
                    backgroundImage: AssetImage("assets/img/developer.png"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomBarItemChanged,
        currentIndex: _currentbottomPos,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
            icon: Icon(Icons.content_paste,color: Colors.grey,),
            activeIcon: Icon(Icons.content_paste,color:cust_backgroundColor,),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Icon(Icons.person,color: Colors.grey,),
            activeIcon: Icon(Icons.person,color:cust_backgroundColor,),
          ),
        ] 
      ),

      body:_children[_currentbottomPos]
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
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Prevention",style: cust_HeadingTextStyle,),
                      
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
                            Text("Stay At Home",style: cust_bodyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center),
                            Padding(padding: EdgeInsets.only(top:25.0),),
                            Image(image: AssetImage("assets/svg/cough.png"),height: 50,width:50,),
                            Text("Cover Coughs\nand sneezes",style: cust_bodyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center)
                                
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Image(image: AssetImage("assets/svg/distance.png"),height: 50,width:50,),
                            Text("Keep a Safe \n  Distance",style: cust_bodyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center),
                            Padding(padding: EdgeInsets.only(top:5.0),),
                            Image(image: AssetImage("assets/svg/mask.png"),height: 50,width:50,),
                            Text("Wear facemask\nif you are sick",style: cust_bodyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center)
                              
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Image(image: AssetImage("assets/svg/hands.png"),height: 50,width:50,),
                            Text("Wash hands\noften",style: cust_bodyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center),
                            Padding(padding: EdgeInsets.only(top:5.0),),
                            Image(image: AssetImage("assets/svg/clean.png"),height: 50,width:50,),
                            Text("Clean and\ndisinfect",style: cust_bodyTextStyle.copyWith(fontSize: 12),textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
