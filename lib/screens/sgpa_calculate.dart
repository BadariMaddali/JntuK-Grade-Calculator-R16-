import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:jntuk_grade_calculator/helpers/SgpaCalculation.dart';

class SgpaCalculate extends StatefulWidget {
  @override

  final List<String> list;
  final String semester;

  const SgpaCalculate({Key key,this.list,this.semester}) : super(key: key);

  _SgpaCalculateState createState() => _SgpaCalculateState(list: this.list,semester: this.semester);
}

class _SgpaCalculateState extends State<SgpaCalculate> {
  @override

  List<String> grades = ['O','O','O','O','O','O','O','O','O'];

  bool _visible = false;

  List<String> list;

  String semester;

  SgpaCalculation _sgpaCalculation;

  String sgpa="",percentage="";

  ScrollController _scrollController = new ScrollController();

  MediaQueryData data;
  _SgpaCalculateState({this.list,this.semester});

  void _initGrades(){
    for(int i = 0; i<9; i++){
      grades[i] = 'O';
    }
  }
  void _getGrades(){
    int noOfSubjects,noOfLabs;
    switch(this.semester){
      case "1-1" : noOfSubjects = 6;
                   noOfLabs = 3;
                   break;
      case "1-2" : noOfSubjects = 6;
                   noOfLabs = 3;
                   break;
      case "2-1" : noOfSubjects = 6;
                   noOfLabs = 2;
                   break;
      case "2-2" : noOfSubjects = 6;
                   noOfLabs = 2;
                   break;
      case "3-1" : noOfSubjects = 5;
                   noOfLabs = 3;
                   break;
      case "3-2" : noOfSubjects = 5;
                   noOfLabs = 3;
                   break;
      case "4-1" : noOfSubjects = 6;
                   noOfLabs = 2;
                   break;
      case "4-2" : noOfSubjects = 4;
                   noOfLabs = 1;
                   break;
    }
    _sgpaCalculation = new SgpaCalculation(this.grades,noOfSubjects,noOfLabs);
    sgpa = _sgpaCalculation.getSgpa();
    percentage = _sgpaCalculation.getPercentage();
  }
  String _getText(){
    return "SGPA : " + sgpa + "\nPercentage: " + percentage;
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
            onTap: () {
              _getGrades();
              setState((){
                _visible = true;
                _scrollController.animateTo(
                  10000,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1300),
                );
              });
            },
            child: new Container(
              child: new Center(
                  child: new FittedBox(
                    fit: BoxFit.contain,
                    child: new Text(
                      'Submit',
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

    _widgetList.add(
      new SizedBox(
        height: data.size.height*0.02,
      ),
    );
    _widgetList.add(
      new AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration : Duration(milliseconds: 500),
        child: new Card(
          child: new Container(
            padding: new EdgeInsets.all(30.0),
            child: new Center(
                child: new Row(
                  children: <Widget>[
                    new SizedBox(
                      child : new FittedBox(
                        fit:BoxFit.fill,
                        child:new AutoSizeText(
                          _getText(),
                          style: TextStyle(fontSize: 400,
                              color: const Color(0xffffffff),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      width: data.size.width*0.4,
                      height: data.size.height*0.05,
                    ),
                    new SizedBox(
                      width: data.size.width*0.1,
                    ),
                    new SizedBox(
                      child: new RaisedButton(
                        child: Text(
                          "Ok",
                          style: TextStyle(fontSize: 20,
                            color: const Color(0xffffffff),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        color: const Color(0XFF222831),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(430.0),
                            side: BorderSide(color: const Color(0xfff3683f),
                                width: 1.0)
                        ),
                        onPressed: () {
                          setState(() {
                            _visible = false;
                          });
                          _scrollController.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                          _initGrades();
                        },
                      ),
                      width: MediaQuery.of(context).size.width*0.20,
                    ),
                  ],
                )
            ),
            width: data.size.width*0.8,
            height: data.size.height*0.15,
          ),
          elevation: 14,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: const Color(0xfff3683f),
                  width: 1.0)
          ),
          color: const Color(0XFFCB4838),
        ),
      ),
    );
    return _widgetList;
  }

  Widget build(BuildContext context) {
    data = MediaQuery.of(context);
    return Scaffold(
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
