import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:jntuk_grade_calculator/helpers/CgpaCalculation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CgpaCalculate extends StatelessWidget {
  @override

  String semester,category,cgpa = "10.0",percentage = "92.5";
  List<Widget> _widgetsList = new List();
  bool _visible = false;
  List<String> semesters = ['1-1','1-2','2-1','2-2','3-1','3-2','4-1','4-2'];
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();
  TextEditingController controller7 = new TextEditingController();
  TextEditingController controller8 = new TextEditingController();

  List<double> _listOfSgpas = [0,0,0,0,0,0,0,0];

  MediaQueryData data;
  CgpaCalculation _cgpaCalculation;


  CgpaCalculate({Key key, @required this.semester,this.category}) : super(key:key);

  TextEditingController _getController(int i){
    switch(i){
      case 0 : return controller1;
      case 1 : return controller2;
      case 2 : return controller3;
      case 3 : return controller4;
      case 4 : return controller5;
      case 5 : return controller6;
      case 6 : return controller7;
      case 7 : return controller8;
    }
  }
  List<Widget> _getWidgets(String semester){
    int index = semesters.indexOf(semester);
    int i;
    if(category == "Regular")
      i=0;
    else if(category == "Lateral")
      i=2;

    _widgetsList.add(
      new SizedBox(
        height: data.size.height*0.08
      )
    );
    while(i<=index){
      _widgetsList.add(
        new Container(
          padding: EdgeInsets.symmetric(horizontal: data.size.width*0.08, vertical: data.size.height*0.004),
            child: new Container(
              child:new FittedBox(
                  fit: BoxFit.contain,
                  child: new SizedBox(
                    child: new TextFormField(
                      controller: _getController(i),
                      decoration: new InputDecoration(
                          fillColor: const Color(0xff856c8b),
                          labelText: "Semester \"" + semesters[i]+"\"",

                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: const Color(0XFFFFFFFF)),
                          ),
                      ),
                      validator: (val) {
                        if(double.parse(val)>10.0 && double.parse(val)<0)
                          return "Invalid Sgpa";
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: const Color(0xff222831),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1
                      ),

                    ),
                    width: data.size.width*0.8,
                    height: data.size.height*0.05,

                  )

              ),

            )
          /*width: data.size.width*0.8,
          height: data.size.height*0.1,*/
        ),
      );
      i+=1;
    }

    _widgetsList.add(
      new SizedBox(
        height: data.size.height*0.06,
      )
    );

    return _widgetsList;
  }
  String _validate(){

    int index = semesters.indexOf(this.semester);
    int i;
    if(category == "Regular")
      i=0;
    else if(category == "Lateral")
      i=2;

    //return controllers[1].toString();

    /*for(int i=0;i<index;i++){
      if(controllers[i].toString() == "")
        return "Empty Input for : "+semesters[i];
      try {
        if ((double.parse((controllers[i].toString())) < 0) ||
            (double.parse((controllers[i].toString())) > 10.0))
          return "Wrong Input for : " + semesters[i];
      }
      catch(e){
        return "Invalid Input for : " + semesters[i];
      }
    }
    return "";*/


    while(i<=index){
      if(_getController(i).text == "")
        return "Empty Input for : "+semesters[i];
      try {
        if ((double.parse((_getController(i).text)) < 0) ||
            (double.parse((_getController(i).text)) > 10.0))
          return "Wrong Input for : " + semesters[i] + "\nSGPA should be in the range of 0 to 10";
      }
      catch(e){
        return "Invalid Input for : " + semesters[i] + "\nSGPA should be in the range of 0 to 10";
      }
      i+=1;
    }
    return "";
  }
  void _initTextFields(){
    int index = semesters.indexOf(this.semester);
    int i;
    if(category == "Regular")
      i=0;
    else if(category == "Lateral")
      i=2;

    while(i<=index){
      _getController(i).text = "";
      i+=1;
    }
  }
  void _getCgpas(){
    int index = semesters.indexOf(this.semester);
    int i;
    if(category == "Regular")
      i=0;
    else if(category == "Lateral"){
      _listOfSgpas[0] = 10;
      _listOfSgpas[1] = 10;
      i=2;
    }
    while(i<=index){
      double currentSgpa = double.parse(_getController(i).text);
      _listOfSgpas[i] = currentSgpa;
      i+=1;
    }

    _cgpaCalculation = new CgpaCalculation(_listOfSgpas,index);
    cgpa = _cgpaCalculation.getCgpa();
    percentage = _cgpaCalculation.getPercentage();
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
          'CGPA Calculator',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
            color: const Color(0xff222831),
            fontFamily: 'Freeroad',
            fontStyle: FontStyle.normal,  ),
        ),

      ),
      body: new Container(
          padding: new EdgeInsets.all(2.0),
          child: new Container(

             padding: new EdgeInsets.all(2.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*new Card(
                    child: new Container(
                      padding: new EdgeInsets.all(35.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new SizedBox(
                            height: MediaQuery.of(context).size.height*0.01,
                          ),
                          new Center(
                              child: FittedBox(fit:BoxFit.fitWidth,
                                child: Text(
                                  'CGPA Calculator',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 200,
                                    color: const Color(0xff222831),
                                    fontFamily: 'Freeroad',
                                    fontStyle: FontStyle.normal,  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.20,
                    ),
                    color: const Color(0XFFECECEC),
                  ),*/
                  Expanded(
                      child: ListView(
                        children: _getWidgets(this.semester),
                      )
                  ),
                  new Container(
                    child:new Card(
                      color: const Color(0XFF3A3D46),
                      child: new InkWell(
                        onTap: () {
                          if(_validate() == ""){
                            _getCgpas();
                            _visible = true;
                            (context as Element).markNeedsBuild();

                          }else{
                            _showToast(_validate());

                          }
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
                  new SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  new AnimatedOpacity(
                    opacity: _visible ? 1 : 0,
                    duration : Duration(milliseconds: 500),
                    child: new Card(
                      child: new Container(
                        padding: new EdgeInsets.all(20.0),
                        child: new Center(
                          child: new Row(
                            children: <Widget>[
                              new SizedBox(
                                child : new FittedBox(
                                  fit:BoxFit.fill,
                                  child:new AutoSizeText(
                                    'CGPA : ' + cgpa + '\nPercentage : ' + percentage,
                                    style: TextStyle(fontSize: 400,
                                        color: const Color(0xffffffff),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 3
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width*0.4,
                                height: MediaQuery.of(context).size.height*0.05,
                              ),
                              new SizedBox(
                                width: MediaQuery.of(context).size.width*0.06,
                              ),
                              new SizedBox(
                                child: new RaisedButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(fontSize: 15,
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
                                    _visible = false;
                                    _initTextFields();
                                    (context as Element).markNeedsBuild();
                                  },

                                ),

                                width: MediaQuery.of(context).size.width*0.17,
                              ),

                            ],
                          )

                        ),
                        width: MediaQuery.of(context).size.width*0.94,
                        height: MediaQuery.of(context).size.height*0.15,
                      ),
                      elevation: 14,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: const Color(0xfff3683f),
                              width: 1.0)
                      ),
                      //borderOnForeground: false,
                      //margin: EdgeInsets.all(32.0),
                      //color: const Color(0xfffb4273),
                      color: const Color(0XFFCB4838),
                    ),
                  ),

                ],
              )
          )
      ),
    );
  }
}

