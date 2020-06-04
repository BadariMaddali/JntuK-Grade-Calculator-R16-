import 'package:flutter/material.dart';
import 'package:jntuk_grade_calculator/screens/cgpa_calculate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CgpaSelect extends StatefulWidget {
  @override
  _CgpaSelectState createState() => _CgpaSelectState();
}

class _CgpaSelectState extends State<CgpaSelect> {
  @override
  String branch = "CIVIL";
  String semester = "1-2";
  String category = "Regular";
  int _radioValue = 0;

  void _OnRadioStateChanged(int value){
    setState((){
        _radioValue= value;
        switch(value){
          case 0: category = "Regular";
          return;
          case 1: category = "Lateral";
          return;
        }
    });
  }
  void _showToast(String toastMessage){
    Fluttertoast.showToast(
      msg: toastMessage,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: const Color(0xff4d4c7d),
      fontSize: 20,
      textColor: const Color(0xffffffff),
      timeInSecForIosWeb: 10,
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF7F7F7),
        iconTheme: IconThemeData(
          color: const Color(0xff222831),
        ),
        title: const Text(
          'CGPA Calculator',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
            color: const Color(0xff222831),
            fontFamily: 'Freeroad',
            fontStyle: FontStyle.normal,  ),
        ),

      ),
      backgroundColor: const Color(0XFFF8F8F8),
      body: new Container(
        //padding: new EdgeInsets.all(32.0),

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
                                  'Select Current Semester',
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
                                        items: <String>['1-2','2-1','2-2','3-1','3-2','4-1','4-2']
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
                      color: const Color(0XFF3C558C),
                    ), // semester
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1 ),
                      child: new Center(
                        child: new FittedBox(
                          fit: BoxFit.contain,
                          child:new Row(
                            children: <Widget>[
                              new Radio(
                                value: 0,
                                groupValue: _radioValue,
                                onChanged: _OnRadioStateChanged,
                              ),
                              new FittedBox(
                                fit:BoxFit.contain,
                                child:new Text(
                                  'Regular',
                                  style: TextStyle(fontSize: 20,
                                      color: const Color(0xff222831),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              new Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: _OnRadioStateChanged,
                              ),
                              new FittedBox(
                                fit:BoxFit.contain,
                                child:new Text(
                                  'Lateral',
                                  style: TextStyle(fontSize: 20,
                                      color: const Color(0xff222831),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      width: MediaQuery.of(context).size.width*0.8,
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    new Card(
                      color: const Color(0XFF3A3D46),
                      child: new InkWell(
                        onTap: () {
                          if(semester == "1-2" && category == "Lateral"){
                            _showToast("Invalid Selection");
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CgpaCalculate(semester: semester,category: category,)),
                            );
                          }
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
                    ),

                  ],
                ),
              ),

            ]
        ),

      ),
    );
  }
}
