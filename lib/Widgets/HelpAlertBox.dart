import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HelpAlertBox extends StatefulWidget {
  @override
  _HelpAlertBoxState createState() => _HelpAlertBoxState();
}

class _HelpAlertBoxState extends State<HelpAlertBox> {
  String statehintText="Select the State";
  bool isLoading=false,isStateChanged=false;
  List data;
  String emergencyPhone="100";
  String jsonUrl="https://api.rootnet.in/covid19-in/contacts";


  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Help"),
      content: SizedBox(
        height: 350,
          child: Column(
          children: <Widget>[
            SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                 Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: cust_yellowishBackground,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),
                  child: ListTile(
                    leading: Icon(Icons.error,color: Colors.red,),
                    title: Text("Temporary Our service is only available in India",style:TextStyle(color:cust_backgroundColor,fontSize: 15),),
                    ),
                  ),
                
                Padding(padding: EdgeInsets.only(top:20),),
                DropdownButton(
                  items: <String>["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jharkhand","Karnataka", "Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu", "Telengana","Tripura", "Uttarakhand", "Uttar Pradesh","West Bengal","Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli","Daman & Diu","Delhi","Jammu and Kashmir", "Ladakh","Lakshadweep","Puducherry",]
                  .map((String value){
                    return DropdownMenuItem<String>(
                      value:value,
                      child:Text(value),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      statehintText=value;
                      isLoading=true;
                    });
                    fetchEmergencyPhone(value);
                  },
                  hint: Text(statehintText),
                ),
                Padding(padding: EdgeInsets.only(top:20),),
                Visibility(
                  visible: isLoading?true:false,
                  child: CircularProgressIndicator(backgroundColor: cust_backgroundColor,),
                ),
                Visibility(
                  visible:isStateChanged?true:false,
                    child: GestureDetector(
                    onTap: (){
                      _makePhoneCall('tel:$emergencyPhone');
                    },
                     child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:cust_backgroundColor,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.local_hospital,color: Colors.red,),
                        title: Text(emergencyPhone,style:cust_TitleTextStyle,),
                        trailing: Icon(Icons.call,color: Colors.green,),
                      ),
                  ),
                    ),
                ),
                Padding(padding: EdgeInsets.only(top:30.0)),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: cust_backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: ListTile(
                    leading: Icon(Icons.arrow_downward,color: Colors.green,),
                    title:Column(
                      children: <Widget>[
                        Container(
                          child:Text("Download Arogya Setu App to test yourself!",style:TextStyle(color: Colors.white,fontSize:13),),
                        ),
                      ],
                    ),
                    trailing: IconButton(icon: Icon(Icons.open_in_new,color: Colors.white,),onPressed: (){_openUrl("https://mygov.in/aarogya-setu-app/");},),
                  ),
                ),
                
              ],
            ),
          ),
          )
          ],
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: (){Navigator.of(context).pop();},
          child: Text("Close",style:TextStyle(color: Colors.white)),
          color: Colors.orange,
        )
      ],
    );
  }

  //open Aarogya setu app url
  _openUrl(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not Launch $url';
    }
  }


  //fetch Emergency phone on State selected
  Future<String> fetchEmergencyPhone(String state) async{
    var response= await http.get(
      Uri.encodeFull(jsonUrl)
    );
    setState(() {
      var convertDataToJson=json.decode(response.body);
      data=convertDataToJson["data"]["contacts"]["regional"];
      for(int i=0;i<data.length;i++){
        if(data[i]['loc']==state){
          setState(() {
            isLoading=false;
            isStateChanged=true;
            emergencyPhone=data[i]['number'];
          });
          break;
        }
      }
    });
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
}