import 'dart:convert';
import 'dart:ffi';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seniordesign/globals/globals.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

String firstname = "USER";
String lastname = "USER";
String email = "USEREMAIL";
String  gpa = "0.0";
String catalogyear = "####-####";
String classification = "Undergrad";
String hours = "0";
String advancedhours = "0";
String advancedcshours = "0";
double perA = 0.32;

Future<Void> StudentInfo() async {
  //String username,password,fn,ln,id;
  String value = await storage.read(key: "token");
  print("This is the supposed Token $value");
  final response = await http.get(
    "$address/MyInfo",
    headers: {HttpHeaders.authorizationHeader: "Bearer $value"},
  );

  Map<String, dynamic> data = json.decode(response.body);
  print("return the JSON of info ==> $data");

  if(data["FirstName"] != "")      firstname       = data["FirstName"];
  if(data["LastName"] != "")       lastname        = data["LastName"];
  if(data["Email"] != "")          email           = data["Email"];
  if(data["GPA"] != "")            gpa             = data["GPA"];
  if(data["CatalogYear"] != "")    catalogyear     = data["CatalogYear"];   
  if(data["Classification"] != "") classification  = data["Classification"]; 
  if(data["Hours"] != "")          hours           = data["Hours"];
  if(data["AdvancedCSHours"] != "")advancedcshours = data["AdvancedCsHours"];
  if(data["AdvancedHours"] != "")  advancedhours   = data["AdvancedHours"];



  return null;

}

class StudentMainScreen extends StatefulWidget {
  //StudentMainScreen({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _StudentMainScreenState createState() => new _StudentMainScreenState();
}

class _StudentMainScreenState extends State<StudentMainScreen> {
  int statusCode = 0;
  @override
  Widget build(BuildContext context) {
    StudentInfo();
    return new Scaffold(
      backgroundColor: Color(0xff65646a),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10.0),
                  //color: Color(0xffebebe8),
                  width: 48.0 * 8,
                  height: 48.0 * 1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffebebe8), Color(0xffebebe8)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: (Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(" Welcome! $firstname $lastname",
                            style: TextStyle(
                                color: Color(0xffcf4411),
                                fontWeight: FontWeight.bold)),

                        ///Here
                      ])),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10.0),
                  //color: Color(0xffebebe8),
                  width: 48.0 * 8,
                  height: 48.0 * 3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffebebe8), Color(0xffebebe8)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: (Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: new CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 12.0,
                          percent: perA,
                          center: new Text("${(perA*100).toInt()}",
                              style: TextStyle(
                                  color: Color(0xffcf4411), fontSize: 30)),
                          progressColor: Color(0xffcf4411),
                          backgroundColor: Color(0xffebebe8),
                        ),
                      ),
                      Column(children: [
                        Text("10%",
                            style: TextStyle(
                                color: Color(0xffcf4411), fontSize: 30)),
                      ]),
                      Column(children: [
                        Text("10%",
                            style: TextStyle(
                                color: Color(0xffcf4411), fontSize: 30)),
                      ]),
                    ],
                  )),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10.0),
                  //color: Color(0xffebebe8),
                  width: 48.0 * 8,
                  height: 48.0 * 9,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffebebe8), Color(0xffebebe8)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: new CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 12.0,
                                percent: 0.9,
                                center: new Text("General\n Core",
                                    style: TextStyle(color: Color(0xffcf4411))),
                                progressColor: Color(0xffcf4411),
                                backgroundColor: Color(0xffebebe8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: new CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 12.0,
                                percent: 0.9,
                                center: new Text("General\n Core",
                                    style: TextStyle(color: Color(0xffcf4411))),
                                progressColor: Color(0xffcf4411),
                                backgroundColor: Color(0xffebebe8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: new CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 12.0,
                                percent: 0.9,
                                center: new Text("General\n Core",
                                    style: TextStyle(color: Color(0xffcf4411))),
                                progressColor: Color(0xffcf4411),
                                backgroundColor: Color(0xffebebe8),
                              ),
                            ),
                          ],
                        ),

                        ///Here
                      ])),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
