import 'package:flutter/material.dart';
import 'package:jntuk_grade_calculator/database/Database.dart';
import 'package:jntuk_grade_calculator/screens/sg_semester_save.dart';
import 'package:jntuk_grade_calculator/database/SemesterModel.dart';
import 'package:jntuk_grade_calculator/database/DetailsModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:jntuk_grade_calculator/screens/sg_grades_see.dart';

class SGDashboard extends StatefulWidget {
  @override

  final List<Semesters> list;
  const SGDashboard({Key key,this.list}) : super(key: key);
  _SGDashboardState createState() => _SGDashboardState(list: list);
}

class _SGDashboardState extends State<SGDashboard> {
  @override

  List<Semesters> list;

  _SGDashboardState({this.list});

  MediaQueryData data;
  List<String> _semesters = ['1-1','1-2','2-1','2-2','3-1','3-2','4-1','4-2',''];
  List<Widget> _widgetList = new List();

  List<Details> _detailsList;
  String _branch,_category,_semester;

  void _initialize() async{
    _detailsList = await DBProvider.db.getDetails();

    _branch = _detailsList[0].branch;
    _category = _detailsList[0].category;
    if(_category == "Regular")
      _semester = _semesters[list.length];
    else
      _semester = _semesters[list.length+2];

  }

  void _showToast(String toastMessage){
    Fluttertoast.showToast(
      msg: toastMessage,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: const Color(0xff4d4c7d),
      gravity: ToastGravity.CENTER,
      fontSize: 20,
      textColor: const Color(0xffffffff),
      timeInSecForIosWeb: 10,

    );
  }


  List<Widget> _getSemWidgets()  {
     _initialize();
     _widgetList.add(
            new SizedBox(
              height: data.size.height*0.02,
            )
     );

    for(int i=0;i<list.length;i++){
      _widgetList.add(
          new Container(
            child: new Card(
              color: const Color(0xff16817a),
              child: InkWell(
                onTap: () async {
                  final subjectsdb = await DBProvider.db.getSubjects(
                      _branch, list[i].sem);
                  List<String> subjectsList = [];
                  subjectsList.add(subjectsdb.subject1);
                  subjectsList.add(subjectsdb.subject2);
                  subjectsList.add(subjectsdb.subject3);
                  if (subjectsdb.subject4 != "")
                    subjectsList.add(subjectsdb.subject4);
                  if (subjectsdb.subject5 != "")
                    subjectsList.add(subjectsdb.subject5);
                  if (subjectsdb.subject6 != "")
                    subjectsList.add(subjectsdb.subject6);
                  subjectsList.add(subjectsdb.lab1);
                  if (subjectsdb.lab2 != "")
                    subjectsList.add(subjectsdb.lab2);
                  if (subjectsdb.lab3 != "")
                    subjectsList.add(subjectsdb.lab3);


                  final gradesdb = await DBProvider.db.getGradesOfSemester(
                      list[i].sem);
                  List<String> gradesList = [];
                  gradesList.add(gradesdb.subject1);
                  gradesList.add(gradesdb.subject2);
                  gradesList.add(gradesdb.subject3);
                  if (gradesdb.subject4 != "")
                    gradesList.add(gradesdb.subject4);
                  if (gradesdb.subject5 != "")
                    gradesList.add(gradesdb.subject5);
                  if (gradesdb.subject6 != "")
                    gradesList.add(gradesdb.subject6);
                  gradesList.add(gradesdb.lab1);
                  if (gradesdb.lab2 != "")
                    gradesList.add(gradesdb.lab2);
                  if (gradesdb.lab3 != "")
                    gradesList.add(gradesdb.lab3);


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        SgGrades(list: subjectsList,
                          semester: list[i].sem,
                          category: _category,
                          grades: gradesList,)),
                  );
                },
                child: Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.symmetric(vertical:data.size.height*0.03),
                      child: new SizedBox(
                        child:new AutoSizeText(
                          list[i].sem,
                          maxFontSize: 30,
                          style: TextStyle(fontSize: 30,
                              color: const Color(0xffffffff),
                              fontFamily: 'Freeroad',
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        height: data.size.height*0.07,
                        width: data.size.width*0.25,
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                      width: data.size.width*0.5,
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          new SizedBox(
                            child:new AutoSizeText(
                              'sgpa: ' + list[i].sgpa,
                              maxFontSize: 15,
                              style: TextStyle(fontSize: 15,
                                  color: const Color(0xffffffff),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1
                              ),
                              textAlign: TextAlign.center,
                            ),
                            height: data.size.height*0.025,

                          ),

                          new SizedBox(
                            child:new AutoSizeText(
                              'cgpa: ' + list[i].cgpa,
                              maxFontSize: 15,
                              style: TextStyle(fontSize: 15,
                                  color: const Color(0xffffffff),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1
                              ),
                              textAlign: TextAlign.center,
                            ),
                            height: data.size.height*0.025,

                          ),

                        ],
                      ),

                    ),
                    new Container(
                      width: data.size.width*0.15,
                      child: Icon(Icons.arrow_forward,color: Colors.white,size: 35,),

                    ),
                  ],
                ),
              ),

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
            ),
            width: data.size.width*0.8,
            height: data.size.height*0.10,
          )
      );
    }
    return _widgetList;
  }

  Widget build(BuildContext context) {
    data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0XFFF8F8F8),
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
      body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ListView(
                    children:  _getSemWidgets(),
                    padding: EdgeInsets.symmetric(horizontal: data.size.width*0.03),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: new Container(
                  child: new RaisedButton(
                    color: const Color(0XFF3A3D46),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: new Container(
                      child: new Center(
                          child: new FittedBox(
                            fit: BoxFit.contain,
                            child: new Text(
                              'Add Semester',
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
                    ),

                    onPressed: () async {
                      if(_semester == "")
                        _showToast("You cannot Add more!");
                      else {
                        final subjectsdb = await DBProvider.db.getSubjects(_branch,_semester);
                        List<String> subjectsList = [];
                        subjectsList.add(subjectsdb.subject1);
                        subjectsList.add(subjectsdb.subject2);
                        subjectsList.add(subjectsdb.subject3);
                        if(subjectsdb.subject4 != "")
                          subjectsList.add(subjectsdb.subject4);
                        if(subjectsdb.subject5 != "")
                          subjectsList.add(subjectsdb.subject5);
                        if(subjectsdb.subject6 != "")
                          subjectsList.add(subjectsdb.subject6);
                        subjectsList.add(subjectsdb.lab1);
                        if(subjectsdb.lab2 != "")
                          subjectsList.add(subjectsdb.lab2);
                        if(subjectsdb.lab3 != "")
                          subjectsList.add(subjectsdb.lab3);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SemesterSave(list : subjectsList,semester: _semester,category:_category,)),
                        );
                      }
                    },
                  ),
                  width: data.size.width*0.9,
                  height: data.size.height*0.08,
                  padding: EdgeInsets.symmetric(horizontal: data.size.width*0.02),
                )
              )
            ],
          )
      )
    );
  }
}
