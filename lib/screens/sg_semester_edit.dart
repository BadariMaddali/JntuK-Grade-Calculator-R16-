import 'package:flutter/material.dart';
import 'package:jntuk_grade_calculator/helpers/SgpaCalculation.dart';
import 'package:jntuk_grade_calculator/helpers/CgpaCalculation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:jntuk_grade_calculator/database/Database.dart';
import 'package:jntuk_grade_calculator/screens/home_screen.dart';
import 'package:jntuk_grade_calculator/database/SemesterModel.dart';
import 'package:jntuk_grade_calculator/database/GradesModel.dart';

class SemesterEdit extends StatefulWidget {

  final List<String> list;
  final String semester;
  final String category;
  final List<String> grades;

  const SemesterEdit({Key key,this.list,this.semester,this.category,this.grades}) : super(key: key);

  @override
  _SemesterEditState createState() => _SemesterEditState(list: this.list,semester: this.semester,category: this.category,grades: this.grades);
}

class _SemesterEditState extends State<SemesterEdit> {

  List<String> list;
  String semester;
  String category;
  List<String> grades;

  _SemesterEditState({this.list,this.semester,this.category,this.grades});

  SgpaCalculation _sgpaCalculation;
  CgpaCalculation _cgpaCalculation;

  String sgpa="",cgpa="j";

  double dsgpa;

  ScrollController _scrollController = new ScrollController();

  MediaQueryData data;


  int _noOfSubjects,_noOfLabs;

  List<String> _getdbGrades(){
    List<String> _dbgrades = ['','','','','','','','',''];
    int i,j=0;
    for(i=0;i<_noOfSubjects;i++,j++){
      _dbgrades[i] = grades[j];
    }
    for(i=6;i<6+_noOfLabs;i++,j++){
      _dbgrades[i] = grades[j];
    }
    if(this.semester == "4-2")
      _dbgrades[5] = grades[5];
    return _dbgrades;
  }

  void _getGrades(){
    switch(this.semester){
      case "1-1" : _noOfSubjects = 6;
      _noOfLabs = 3;
      break;
      case "1-2" : _noOfSubjects = 6;
      _noOfLabs = 3;
      break;
      case "2-1" : _noOfSubjects = 6;
      _noOfLabs = 2;
      break;
      case "2-2" : _noOfSubjects = 6;
      _noOfLabs = 2;
      break;
      case "3-1" : _noOfSubjects = 5;
      _noOfLabs = 3;
      break;
      case "3-2" : _noOfSubjects = 5;
      _noOfLabs = 3;
      break;
      case "4-1" : _noOfSubjects = 6;
      _noOfLabs = 2;
      break;
      case "4-2" : _noOfSubjects = 4;
      _noOfLabs = 1;
      break;
    }
  }
  void _getSgpa(){
    _sgpaCalculation = new SgpaCalculation(this.grades,_noOfSubjects,_noOfLabs);

    sgpa = _sgpaCalculation.getSgpa();
    dsgpa = _sgpaCalculation.getDSgpa();
    sgpa  += " (" +  _sgpaCalculation.getPercentage() + "%)";
  }

  void _updateCgpa() async{
    List<double> _listOfSgpas = [0,0,0,0,0,0,0,0];
    List<String> semesterslist = ['1-1','1-2','2-1','2-2','3-1','3-2','4-1','4-2'];
    int i,j=0;
    int index = semesterslist.indexOf(this.semester);
    if(category == "Regular")
      i=0;
    else if(category == "Lateral"){
      _listOfSgpas[0] = 10;
      _listOfSgpas[1] = 10;
      i=2;
    }
    List<Semesters> sgpas = await DBProvider.db.getSemesters();
    while(i<index){
      double currentSgpa = double.parse((sgpas[j].sgpa).substring(0,4));
      _listOfSgpas[i] = currentSgpa;
      i+=1; j+=1;
    }

    _listOfSgpas[i] = dsgpa;

    _cgpaCalculation = new CgpaCalculation(_listOfSgpas,index);
    cgpa = _cgpaCalculation.getCgpa();
    cgpa += " (" + _cgpaCalculation.getPercentage() + "%)";


    Semesters semestersObject = new Semesters();
    semestersObject.sem = this.semester;
    semestersObject.sgpa = sgpa;
    semestersObject.cgpa = cgpa;
    await DBProvider.db.updateSemesters(semestersObject);



    for(int k = (index+1); k<sgpas.length;k++){

      final listOfSemesters = await DBProvider.db.getSemesters();

      List<double> _listOfSgpas = [0,0,0,0,0,0,0,0];

      int i,j=0;
      if(category == "Regular")
        i=0;
      else if(category == "Lateral"){
        _listOfSgpas[0] = 10;
        _listOfSgpas[1] = 10;
        i=2;
      }
      while(i<=k){
        double currentSgpa = double.parse((listOfSemesters[j].sgpa).substring(0,4));
        _listOfSgpas[i] = currentSgpa;
        i+=1; j+=1;
      }
      _cgpaCalculation = new CgpaCalculation(_listOfSgpas,k);
      String updatedCgpa = _cgpaCalculation.getCgpa();
      updatedCgpa += " (" + _cgpaCalculation.getPercentage() + "%)";

      Semesters semestersObject = new Semesters();
      semestersObject.sem = listOfSemesters[k].sem;
      semestersObject.sgpa = listOfSemesters[k].sgpa;
      semestersObject.cgpa = updatedCgpa;
      await DBProvider.db.updateSemesters(semestersObject);
    }
  }

  List<Widget> _getESubjects(String items){
    items = items.split(":")[1];
    List<Widget> Esubs = new List();
    List<String> electiveSubjects = items.split(",");
    for(int i=0;i<electiveSubjects.length;i++){
      Esubs.add(
        new Text(
          "* " + electiveSubjects[i],
          style: TextStyle(fontSize: 15,
            color: const Color(0xff222831),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Esubs;
  }
  void _showDialog(BuildContext context,String items) async{
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Elective Subject",
              style: TextStyle(fontSize: 25,
                color: const Color(0xff222831),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
            ),
            backgroundColor: const Color(0xfff5f5f5),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: _getESubjects(items)
            ),
            actions: <Widget>[
              new FlatButton(
                child: Text(
                  "Ok",
                  style: TextStyle(fontSize: 20,
                    color: const Color(0xff222831),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        });
  }


  List<Widget> _getChildrenWidgets(){
    List<Widget> _widgetList = new List();

    _widgetList.add(
        new SizedBox(
          height: data.size.height*0.05,
        )
    );
    for(int i=0;i<list.length;i++){
      if(this.semester == "3-2" && i==4){
        _widgetList.add(
            new Card(
              child: new Container(
                padding: new EdgeInsets.symmetric(horizontal: data.size.width*0.03,vertical: 2.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new SizedBox(
                            child: new AutoSizeText(
                              "Elective",
                              maxFontSize: 16,
                              style: TextStyle(fontSize: 25,
                                color: const Color(0xffffffff),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                            width: data.size.width*0.5,
                          ),
                          new SizedBox(
                            child: new FlatButton(
                              child: Icon(Icons.info_outline,color: Colors.black,),
                              onPressed: (){
                                _showDialog(context,list[i]);
                              },
                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new SizedBox(
                      width: data.size.width*0.07,
                    ),
                    new FittedBox(

                        fit:BoxFit.contain,
                        child: new Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: const Color(0XFF808080),
                            ),
                            child: new DropdownButton<String>(
                              value: grades[i],
                              //isDense: true,
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: const Color(0xff222831),
                              ),
                              style: TextStyle(color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff222831),
                              ),
                              items: <String>['O','S','A','B','C','D','F']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 23,
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
                                  grades[i] = newValue;
                                });
                              },
                            )
                        )
                    ),
                  ],
                ),
                width: data.size.width*0.85,
                height: data.size.height*0.07,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: const Color(0xfff2a365),
                      width: 0.5)
              ),
              color: const Color(0xff856c8b),
            )
        );
      }
      else if(this.semester == "4-1" && i==4){
        _widgetList.add(
            new Card(
              child: new Container(
                padding: new EdgeInsets.symmetric(horizontal: data.size.width*0.03,vertical: 2.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new SizedBox(
                            child: new AutoSizeText(
                              "Elective",
                              maxFontSize: 16,
                              style: TextStyle(fontSize: 25,
                                color: const Color(0xffffffff),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                            width: data.size.width*0.5,
                          ),
                          new SizedBox(
                            child: new FlatButton(
                              child: Icon(Icons.info_outline,color: Colors.black,),
                              onPressed: (){
                                //_showPopup(list[i]);
                                _showDialog(context,list[i]);
                              },
                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1200.0)),


                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new SizedBox(
                      width: data.size.width*0.07,
                    ),
                    new FittedBox(

                        fit:BoxFit.contain,
                        child: new Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: const Color(0XFF808080),
                            ),
                            child: new DropdownButton<String>(
                              value: grades[i],
                              //isDense: true,
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: const Color(0xff222831),
                              ),
                              style: TextStyle(color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff222831),
                              ),
                              items: <String>['O','S','A','B','C','D','F']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 23,
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
                                  grades[i] = newValue;
                                });
                              },
                            )
                        )
                    ),


                  ],
                ),
                width: data.size.width*0.85,
                height: data.size.height*0.07,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: const Color(0xfff2a365),
                      width: 0.5)
              ),
              color: const Color(0xff856c8b),
            )
        );
      }
      else if(this.semester == "4-1" && i==5){
        _widgetList.add(
            new Card(
              child: new Container(
                padding: new EdgeInsets.symmetric(horizontal: data.size.width*0.03,vertical: 2.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new SizedBox(
                            child: new AutoSizeText(
                              "Elective",
                              maxFontSize: 16,
                              style: TextStyle(fontSize: 25,
                                color: const Color(0xffffffff),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                            width: data.size.width*0.5,
                          ),
                          new SizedBox(
                            child: new FlatButton(
                              child: Icon(Icons.info_outline,color: Colors.black,),
                              onPressed: (){
                                //_showPopup(list[i]);
                                _showDialog(context,list[i]);
                              },
                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1200.0)),


                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new SizedBox(
                      width: data.size.width*0.07,
                    ),
                    new FittedBox(

                        fit:BoxFit.contain,
                        child: new Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: const Color(0XFF808080),
                            ),
                            child: new DropdownButton<String>(
                              value: grades[i],
                              //isDense: true,
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: const Color(0xff222831),
                              ),
                              style: TextStyle(color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff222831),
                              ),
                              items: <String>['O','S','A','B','C','D','F']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 23,
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
                                  grades[i] = newValue;
                                });
                              },
                            )
                        )
                    ),


                  ],
                ),
                width: data.size.width*0.85,
                height: data.size.height*0.07,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: const Color(0xfff2a365),
                      width: 0.5)
              ),
              color: const Color(0xff856c8b),
            )
        );
      }
      else if(this.semester == "4-2" && i==3){
        _widgetList.add(
            new Card(
              child: new Container(
                padding: new EdgeInsets.symmetric(horizontal: data.size.width*0.03,vertical: 2.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new SizedBox(
                            child: new AutoSizeText(
                              "Elective",
                              maxFontSize: 16,
                              style: TextStyle(fontSize: 25,
                                color: const Color(0xffffffff),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                            width: data.size.width*0.5,
                          ),
                          new SizedBox(
                            child: new FlatButton(
                              child: Icon(Icons.info_outline,color: Colors.black,),
                              onPressed: (){
                                //_showPopup(list[i]);
                                _showDialog(context,list[i]);
                              },
                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1200.0)),


                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new SizedBox(
                      width: data.size.width*0.07,
                    ),
                    new FittedBox(

                        fit:BoxFit.contain,
                        child: new Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: const Color(0XFF808080),
                            ),
                            child: new DropdownButton<String>(
                              value: grades[i],
                              //isDense: true,
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: const Color(0xff222831),
                              ),
                              style: TextStyle(color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff222831),
                              ),
                              items: <String>['O','S','A','B','C','D','F']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 23,
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
                                  grades[i] = newValue;
                                });
                              },
                            )
                        )
                    ),


                  ],
                ),
                width: data.size.width*0.85,
                height: data.size.height*0.07,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: const Color(0xfff2a365),
                      width: 0.5)
              ),
              color: const Color(0xff856c8b),
            )
        );
      }
      else{
        _widgetList.add(
            new Card(
              child: new Container(
                padding: new EdgeInsets.symmetric(horizontal: data.size.width*0.03,vertical: 2.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new SizedBox(
                        child: new AutoSizeText(
                          list[i],
                          maxFontSize: 16,
                          style: TextStyle(fontSize: 25,
                            color: const Color(0xffffffff),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                          ),
                        ),
                        width: data.size.width*0.6,
                      ),
                    ),
                    new SizedBox(
                      width: data.size.width*0.07,
                    ),
                    new FittedBox(

                        fit:BoxFit.contain,
                        child: new Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: const Color(0XFF808080),
                            ),
                            child: new DropdownButton<String>(
                              value: grades[i],
                              //isDense: true,
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: const Color(0xff222831),
                              ),
                              style: TextStyle(color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff222831),
                              ),
                              items: <String>['O','S','A','B','C','D','F']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 23,
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
                                  grades[i] = newValue;
                                });
                              },
                            )
                        )
                    ),


                  ],
                ),
                width: data.size.width*0.85,
                height: data.size.height*0.07,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: const Color(0xfff2a365),
                      width: 0.5)
              ),
              color: const Color(0xff856c8b),
            )
        );
      }
    }

    if(this.semester == "4-2"){
      _widgetList.add(
          new Card(
            child: new Container(
              padding: new EdgeInsets.symmetric(horizontal: data.size.width*0.03,vertical: 2.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new SizedBox(
                      child: new AutoSizeText(
                        "Project",
                        maxFontSize: 16,
                        style: TextStyle(fontSize: 25,
                          color: const Color(0xffffffff),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                      width: data.size.width*0.6,
                    ),
                  ),
                  new SizedBox(
                    width: data.size.width*0.07,
                  ),
                  new FittedBox(

                      fit:BoxFit.contain,
                      child: new Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: const Color(0XFF808080),
                          ),
                          child: new DropdownButton<String>(
                            value: grades[5],
                            //isDense: true,
                            icon: Icon(Icons.keyboard_arrow_down,
                              color: const Color(0xff222831),
                            ),
                            style: TextStyle(color: Colors.blue),
                            underline: Container(
                              height: 2,
                              color: const Color(0xff222831),
                            ),
                            items: <String>['O','S','A','B','C','D','F']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 23,
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
                                grades[5] = newValue;
                              });
                            },
                          )
                      )
                  ),


                ],
              ),
              width: data.size.width*0.85,
              height: data.size.height*0.07,
            ),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: const Color(0xfff2a365),
                    width: 0.5)
            ),
            color: const Color(0xff856c8b),
          )
      );
    }

    _widgetList.add(
      new SizedBox(
        height: data.size.height*0.02,
      ),
    );

    _widgetList.add(
      new Container(
        child:new Card(
          color: const Color(0XFF3A3D46),
          child: new InkWell(
            onTap: () async {

              _getGrades();
              _getSgpa();
              _updateCgpa();
              List<String> _dbGrades = _getdbGrades();
              Grades gradesObject = new Grades();
              gradesObject.sem = this.semester;
              gradesObject.subject1 = _dbGrades[0];
              gradesObject.subject2 = _dbGrades[1];
              gradesObject.subject3 = _dbGrades[2];
              gradesObject.subject4 = _dbGrades[3];
              gradesObject.subject5 = _dbGrades[4];
              gradesObject.subject6 = _dbGrades[5];
              gradesObject.lab1 = _dbGrades[6];
              gradesObject.lab2 = _dbGrades[7];
              gradesObject.lab3 = _dbGrades[8];

              await DBProvider.db.updateGrades(gradesObject);

              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: new Container(
              child: new Center(
                  child: new FittedBox(
                    fit: BoxFit.contain,
                    child: new Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25,
                          color: const Color(0xffffffff),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 3
                      ),
                    ),
                  )
              ),

              width: data.size.width*0.4,
              height: data.size.height*0.06,
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120.0)),
        ),
        padding: EdgeInsets.symmetric(horizontal: data.size.width*0.25),
      ),
    );


    return _widgetList;
  }

  @override
  Widget build(BuildContext context) {
    data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF7F7F7),
        iconTheme: IconThemeData(
          color: const Color(0xff222831),
        ),
        title: const Text(
          'Save your Grades',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
            color: const Color(0xff222831),
            fontFamily: 'Freeroad',
            fontStyle: FontStyle.normal,  ),
        ),
      ),
      body : Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: new Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: _getChildrenWidgets(),
                  controller: _scrollController,
                ),
              )
            ],
          )
      ),

    );
  }
}
