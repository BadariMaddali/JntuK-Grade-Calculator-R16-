import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF7F7F7),
        iconTheme: IconThemeData(
          color: const Color(0xff222831),
        ),
        title: const Text(
          'App Info',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
            color: const Color(0xff222831),
            fontFamily: 'Freeroad',
            fontStyle: FontStyle.normal,  ),
        ),

      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
              child: new Container(
                padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.025,horizontal:25),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: new AutoSizeText(
                        'Packages Used',
                        style: TextStyle(fontSize: 300,
                            color: const Color(0xffffffff),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.035,
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    new SizedBox(
                      child: new AutoSizeText(
                        'sqflite',
                        style: TextStyle(fontSize: 20,
                            color: const Color(0xffffffff).withOpacity(0.9),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.0275,
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    new SizedBox(
                      child: new AutoSizeText(
                        'fluttertoast',
                        style: TextStyle(fontSize: 20,
                            color: const Color(0xffffffff).withOpacity(0.9),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.0275,
                    ),
                    new SizedBox(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    new SizedBox(
                      child: new AutoSizeText(
                        'auto_size_text',
                        style: TextStyle(fontSize: 20,
                            color: const Color(0xffffffff).withOpacity(0.9),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.0275,
                    ),


                  ],
                ),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.25,
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: const Color(0xff000839),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.08,
            ),
            new Card(
              child: new Container(
                padding: EdgeInsets.symmetric(vertical:15,horizontal:15),
                child: Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          child: new AutoSizeText(
                            'Developed by',
                            style: TextStyle(fontSize: 300,
                                color: const Color(0xffffffff),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1
                            ),
                          ),
                          height: MediaQuery.of(context).size.height*0.03,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height*0.1,
                            width: MediaQuery.of(context).size.height*0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.1,),
                              border: Border.all(width: 2,color: Colors.white.withOpacity(0.9)),
                              image: DecorationImage(
                                image: AssetImage("dimage.jpg"),
                                fit: BoxFit.fill
                              ),
                            )
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.013,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.027,
                                width: MediaQuery.of(context).size.width*0.45,
                                child: AutoSizeText(
                                  'Badari Maddali',
                                  style: TextStyle(fontSize: 205,
                                      color: const Color(0xffffffff),
                                      fontFamily: 'Freeroad',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 2
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.009,
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.location_on,color: const Color(0xfff29a94),size:20),
                                    Text(
                                      'Guntur',
                                      style: TextStyle(fontSize: 22,
                                          color: const Color(0xffffffff).withOpacity(0.85),
                                          fontFamily: 'Monsterrat',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 2
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                ),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.25,
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: const Color(0xff000839),
            )

          ],
        ),
      ),
    );
  }
}
