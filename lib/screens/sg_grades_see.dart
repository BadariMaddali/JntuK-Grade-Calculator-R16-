import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:jntuk_grade_calculator/screens/sg_semester_edit.dart';
import 'package:jntuk_grade_calculator/screens/home_screen.dart';


class SgGrades extends StatefulWidget {

  final List<String> list;
  final String semester;
  final List<String> grades;
  final String category;

  const SgGrades({Key key,this.list,this.semester,this.grades,this.category}) : super(key: key);

  @override
  _SgGradesState createState() => _SgGradesState(list: this.list,semester: this.semester,grades: this.grades,category: this.category);
}

class _SgGradesState extends State<SgGrades> {

  List<String> list;
  String semester;
  List<String> grades;
  String category;

  _SgGradesState({this.list,this.semester,this.grades,this.category});

  MediaQueryData data;

  //List<String> grades = ['O','O','O','O','O','O','O','O','O'];

  ScrollController _scrollController = new ScrollController();

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
                    color: const Color(0xff22ff31),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //color: const Color(0XFF222831),
                /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(430.0),
                    side: BorderSide(color: const Color(0xffffffff),
                        width: 1.0)
                ),*/
                onPressed: () {
                  //Navigator.pop(context);
                  //Navigator.pop(context);
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
                                //_showPopup(list[i]);
                                _showDialog(context,list[i]);
                              },
                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                      //color: Colors.red,
                      width: data.size.width*0.25,
                      child: new SizedBox(
                        child:new AutoSizeText(
                          grades[i],
                          maxFontSize: 35,
                          style: TextStyle(fontSize: 35,
                              color: const Color(0xffffffff),
                              fontFamily: 'Monsterrat',
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        //height: data.size.height*0.07,
                      ),

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
                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                      //color: Colors.red,
                      width: data.size.width*0.25,
                      child: new SizedBox(
                        child:new AutoSizeText(
                          grades[i],
                          maxFontSize: 35,
                          style: TextStyle(fontSize: 35,
                              color: const Color(0xffffffff),
                              fontFamily: 'Monsterrat',
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        //height: data.size.height*0.07,
                      ),

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
                                _showDialog(context,list[i]);
                              },
                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                      //color: Colors.red,
                      width: data.size.width*0.25,
                      child: new SizedBox(
                        child:new AutoSizeText(
                          grades[i],
                          maxFontSize: 35,
                          style: TextStyle(fontSize: 35,
                              color: const Color(0xffffffff),
                              fontFamily: 'Monsterrat',
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        //height: data.size.height*0.07,
                      ),

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
                                _showDialog(context,list[i]);
                              },
                            ),
                            width: data.size.width*0.1,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                      //color: Colors.red,
                      width: data.size.width*0.25,
                      child: new SizedBox(
                        child:new AutoSizeText(
                          grades[i],
                          maxFontSize: 35,
                          style: TextStyle(fontSize: 35,
                              color: const Color(0xffffffff),
                              fontFamily: 'Monsterrat',
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        //height: data.size.height*0.07,
                      ),
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
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                      //color: Colors.red,
                      width: data.size.width*0.25,
                      child: new SizedBox(
                        child:new AutoSizeText(
                          grades[i],
                          maxFontSize: 35,
                          style: TextStyle(fontSize: 35,
                              color: const Color(0xffffffff),
                              fontFamily: 'Monsterrat',
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1
                          ),
                          textAlign: TextAlign.center,
                        ),
                        //height: data.size.height*0.07,
                      ),

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
                  new Container(
                    padding: EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
                    //color: Colors.red,
                    width: data.size.width*0.25,
                    child: new SizedBox(
                      child:new AutoSizeText(
                        grades[5],
                        maxFontSize: 35,
                        style: TextStyle(fontSize: 35,
                            color: const Color(0xffffffff),
                            fontFamily: 'Monsterrat',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                      //height: data.size.height*0.07,
                    ),
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
      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child:new Card(
              color: const Color(0XFF3A3D46),
              child: new InkWell(
                onTap: (){
                 Navigator.pop(context);
                 Navigator.pop(context);
                },
                child: new Container(
                  child: new Center(
                      child: new FittedBox(
                        fit: BoxFit.contain,
                        child: new Text(
                          'Ok',
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
            //padding: EdgeInsets.symmetric(horizontal: data.size.width*0.25),
          ),
          new Container(
            child:new Card(
              color: const Color(0XFF3A3D46),
              child: new InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SemesterEdit(list: list,semester: this.semester,grades: grades,category: category,)),
                  );
                },
                child: new Container(
                  child: new Center(
                      child: new FittedBox(
                        fit: BoxFit.contain,
                        child: new Text(
                          'Edit',
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
            //padding: EdgeInsets.symmetric(horizontal: data.size.width*0.25),
          ),
        ],

      )
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
