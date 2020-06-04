import 'package:flutter/material.dart';
import 'package:jntuk_grade_calculator/database/Database.dart';
import 'package:jntuk_grade_calculator/screens/sgpa_calculate.dart';

class SgpaSelect extends StatefulWidget {
  @override
  _SgpaSelectState createState() => _SgpaSelectState();
}

class _SgpaSelectState extends State<SgpaSelect> {
  @override

  String branch = "CIVIL";
  String semester = "1-1";

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF7F7F7),
        iconTheme: IconThemeData(
          color: const Color(0xff222831),
        ),
        title: const Text(
          'SGPA Calculator',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
            color: const Color(0xff222831),
            fontFamily: 'Freeroad',
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      backgroundColor: const Color(0XFFF8F8F8),
      body: new Container(
        child: new Column(
            children: <Widget>[
              new Center(
                child: new Column(
                  children: <Widget>[
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    new Card(
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
                                  'Select Branch',
                                  style: TextStyle(fontSize: 20,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new FittedBox(
                                  fit:BoxFit.scaleDown,
                                  child: new Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: const Color(0XFF808080),
                                      ),
                                      child: new DropdownButton<String>(
                                        value: branch,
                                        //isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down,
                                          color: const Color(0xff222831),
                                        ),
                                        focusColor: Colors.yellow,
                                        underline: Container(
                                          height: 2,
                                          color: const Color(0xff222831),
                                        ),
                                        items: <String>['CIVIL','EEE','ME','ECE','CSE','IT']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            branch = newValue;
                                          });
                                        },
                                      )
                                  )
                              ),
                            ],
                          ),
                        ),

                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.20,
                      ),
                      elevation: 14,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: const Color(0xfff57170),
                              width: 1.0)
                      ),
                      //borderOnForeground: false,
                      //margin: EdgeInsets.all(32.0),
                      color: const Color(0XFFCB4838),
                    ), // branch
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.08,
                    ),
                    new Card(
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
                                  'Select Semester',
                                  style: TextStyle(fontSize: 20,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new FittedBox(
                                  fit:BoxFit.scaleDown,
                                  child: new Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: const Color(0XFF808080),
                                      ),
                                      child: new DropdownButton<String>(
                                        value: semester,
                                        //isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down,
                                          color: const Color(0xff222831),
                                        ),
                                        style: TextStyle(color: Colors.blue),
                                        underline: Container(
                                          height: 2,
                                          color: const Color(0xff222831),
                                        ),
                                        items: <String>['1-1','1-2','2-1','2-2','3-1','3-2','4-1','4-2']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            semester = newValue;
                                          });
                                        },
                                      )
                                  )
                              ),
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.20,
                      ),
                      elevation: 14,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: const Color(0xff8c82fc),
                              width: 1.0)
                      ),
                      //borderOnForeground: false,
                      //margin: EdgeInsets.all(32.0),
                      color: const Color(0XFF3C558C),
                    ), // semester
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    new Card(
                      color: const Color(0XFF3A3D46),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () async {
                          final s = await DBProvider.db.getSubjects(branch,semester);
                          List<String> list = [];
                          list.add(s.subject1);
                          list.add(s.subject2);
                          list.add(s.subject3);
                          if(s.subject4 != "")
                            list.add(s.subject4);
                          if(s.subject5 != "")
                            list.add(s.subject5);
                          if(s.subject6 != "")
                            list.add(s.subject6);
                          list.add(s.lab1);
                          if(s.lab2 != "")
                            list.add(s.lab2);
                          if(s.lab3 != "")
                            list.add(s.lab3);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SgpaCalculate(list : list,semester: semester,)),
                          );
                        },
                        child: new Container(
                          child: new Center(
                              child: new FittedBox(
                                fit: BoxFit.contain,
                                child: new Text(
                                  'Go',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 3
                                  ),
                                ),
                              )
                          ),
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.06,
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120.0)),
                    ), // button
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }

}
