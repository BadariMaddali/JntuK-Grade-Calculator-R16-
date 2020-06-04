import 'package:flutter/material.dart';
import 'package:jntuk_grade_calculator/screens/sgpa_select.dart';
import 'package:jntuk_grade_calculator/screens/cgpa_select.dart';
import 'package:jntuk_grade_calculator/screens/sg_dashboard.dart';
import 'package:jntuk_grade_calculator/screens/sg_branch_select.dart';
import 'package:jntuk_grade_calculator/screens/app_info.dart';
import 'package:jntuk_grade_calculator/database/Database.dart';
import 'package:jntuk_grade_calculator/database/SemesterModel.dart';
import 'package:jntuk_grade_calculator/helpers/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  List<Semesters> _semesterList;

  void choiceAction(String choice){
    if(choice == Constants.Appinfo){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppInfo()),
      );
    }
  }

  Icon _getIcon(String choice){
    if(choice == "App info"){
      return Icon(Icons.info);
    }
  }

  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF7F7F7),
        iconTheme: IconThemeData(
          color: const Color(0xff222831),
        ),
        title: const Text(
                  'JNTUK R16 GPA Calculator',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25,
                    color: const Color(0xff222831),
                    fontFamily: 'Freeroad',
                    fontStyle: FontStyle.normal,  ),
                ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      _getIcon(choice),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        choice,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                );
              }).toList();
            },
          )
        ],
      ),
      backgroundColor: const Color(0XFFF8F8F8),
      body: new Container(
        padding: new EdgeInsets.all(2.0),
        child: ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                  ),
                  new Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SgpaSelect()),
                        );
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(30.0),
                        child: new FittedBox(
                          fit: BoxFit.contain,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new FittedBox(
                                fit:BoxFit.scaleDown,
                                child:new Text(
                                  'SGPA',
                                  style: TextStyle(fontSize: 40,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 3
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new FittedBox(

                                fit:BoxFit.scaleDown,
                                child:new Text(
                                  '(Semester Grade Point Average)',
                                  style: TextStyle(fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new FittedBox(

                                fit:BoxFit.scaleDown,

                                child:new Text(
                                  'Calculator',
                                  style: TextStyle(fontSize: 40,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.5
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),


                            ],
                          ),
                        ),

                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.20,
                      ),
                    ),
                    elevation: 14,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: const Color(0xfff57170),
                            width: 1.0)
                    ),
                    color: const Color(0XFFCB4838),
                  ),
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  new Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CgpaSelect()),
                        );
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(30.0),
                        child: new FittedBox(
                          fit: BoxFit.contain,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new FittedBox(
                                fit:BoxFit.scaleDown,
                                child:new Text(
                                  'CGPA',
                                  style: TextStyle(fontSize: 40,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 3
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new FittedBox(

                                fit:BoxFit.scaleDown,
                                child:new Text(
                                  '(Cummulative Grade Point Average)',
                                  style: TextStyle(fontSize: 15,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new FittedBox(
                                fit:BoxFit.scaleDown,
                                child:new Text(
                                  'Calculator',
                                  style: TextStyle(fontSize: 40,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.5
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.20,
                      ),
                    ),
                    elevation: 14,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: const Color(0XFF3C558C),
                            width: 1.0)
                    ),
                    color: const Color(0XFF3C558C),
                  ),
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  new Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () async {
                        final details = await DBProvider.db.getDetails();
                        if(details.length == 0){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectBranch()),
                          );
                        }
                        else{
                          _semesterList = await DBProvider.db.getSemesters();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SGDashboard(list: _semesterList )),
                          );
                        }
                      },
                      child: new Container(
                        padding: new EdgeInsets.all(30.0),
                        child: new Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            new FittedBox(

                              fit:BoxFit.fitWidth,
                              child:new Text(
                                'Save Your Grades',
                                style: TextStyle(fontSize: 30,
                                    color: const Color(0xffffffff),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 3
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),



                          ],
                        ),
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.20,
                      ),
                    ),
                    elevation: 14,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: const Color(0xff62d2a2),
                            width: 1.0)
                    ),
                    color: const Color(0XFF00B8A9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
