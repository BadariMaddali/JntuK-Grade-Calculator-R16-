import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jntuk_grade_calculator/database/SubjectsModel.dart';
import 'package:jntuk_grade_calculator/database/SemesterModel.dart';
import 'package:jntuk_grade_calculator/database/DetailsModel.dart';
import 'package:jntuk_grade_calculator/database/GradesModel.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async{
    if(_database!=null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =  join(documentsDirectory.path, "SGPA.db");
    var db = await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Subjects ("
        "branch TEXT,"
        "semester TEXT,"
        "subject1 TEXT,"
        "subject2 TEXT,"
        "subject3 TEXT,"
        "subject4 TEXT,"
        "subject5 TEXT,"
        "subject6 TEXT,"
        "lab1 TEXT,"
        "lab2 TEXT,"
        "lab3 TEXT"
        ")");

    await db.execute("CREATE TABLE Details ("
        "branch TEXT,"
        "category TEXT"
        ")");


    await db.execute("CREATE TABLE Semesters ("
        "sem TEXT,"
        "sgpa TEXT,"
        "cgpa TEXT"
        ")");

    await db.execute("CREATE TABLE Grades ("
        "sem TEXT,"
        "subject1 TEXT,"
        "subject2 TEXT,"
        "subject3 TEXT,"
        "subject4 TEXT,"
        "subject5 TEXT,"
        "subject6 TEXT,"
        "lab1 TEXT,"
        "lab2 TEXT,"
        "lab3 TEXT"
        ")");

    uploadSubjects();
  }

  uploadSubjects() async {

    final db = await database;

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "1-1", "English - I", "Mathematics - I", "Engineering Chemistry", "Engineering Mechanics", "Computer Programming", "Environmental Studies", "Engineering /Applied Chemistry Laboratory", "English - Communication Skills Lab - I", "Computer Programming Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "1-2", "English – II", "Mathematics – II ", "Mathematics – III", "Engineering Physics", "Elements of Mechanical Engineering", "Engineering Drawing", "English - Communication Skills Lab - II ", "Engineering /Applied Physics Lab", "Engg. Workshop & IT Workshop"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "2-1", "Probability & Statistics", "Basic Electrical & Electronics Engineering", "Strength of Materials-I", "Building Materials & Construction", "Surveying", "Fluid Mechanics", "Survey Field Work - I", "Strength of Materials Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "2-2", "Building Planning & Drawing", "Strength of Materials - II", "Hydraulics & Hydraulic Machinery", "Concrete Technology", "Structural Analysis - I", "Transportation Engineering - I", "FM & HM Lab", "Survey Field Work - II", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "3-1", "Management Science", "Engineering Geology", "Structural Analysis -II", "Design & Drawing of Reinforced Concrete Structures", "Transportation Engineering - II", "", "Concrete Technology Lab", "Geology Lab", "Transportation Engineering Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "3-2", "Design & Drawing of Steel Structures", "Geotechnical Engineering - I", "Environmental Engineering -I", "Water Resource Engineering -I", "Elective : Electronic Instrumentation,Data Base Management Systems,Alternative Energy Sources,Waste water Management,Fundamentals of Liquefied Natural Gas,Green Fuel Technologies", "", "Geotechnical Engineering Lab", "Environmental Engineering Lab", "Computer Aided Engineering Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "4-1", "Environmental Engineering - II", "Water Resource Engineering - II", "Geotechnical Engineering - II", "Remote Sensing & GIS Applications", "Elective 1 : Finite Element Methods,Ground Improvement Techniques,Air Pollution & Control,Urban Hydrology,Traffic Engineering", "Elective 2 : Advanced Structural Engineering,Advanced Foundation Engineering,Environmental Impact Assessment & Management,Ground Water Development,Pavement Analysis and Design", "GIS & CAD Lab", "Irrigation Design & Drawing", ""]);

    await db.rawInsert(
    "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CIVIL", "4-2", "Estimation Specification & Contracts", "Construction Technology & Management", "Prestressed Concrete", "Elective 3 : Bridge Engineering,Soil Dynamics and Foundations,Solid and Hazardous Waste Management,Water Resources Systems Planning,Urban Transportation Planning Engg", "", "", "Seminar on Internship Project", "", ""]);





    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "1-1", "English - I", "Mathematics - I", "Applied Chemistry", "Engineering Mechanics", "Computer Programming", "Environmental Studies", "Engineering /Applied Chemistry Laboratory", "English - Communication Skills Lab - I", "Computer Programming Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "1-2", "English – II", "Mathematics – II ", "Mathematics – III", "Applied Physics", "Electrical Circuit Analysis - I", "Engineering Drawing", "English - Communication Skills Lab - II ", "Applied / Engineering Physics Laboratory", "Engg. Workshop & IT Workshop"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "2-1", "Electrical Circuit Analysis - II", "Electrical Machines-I", "Basic Electronics and Devices", "Electro Magnetic Fields", "Thermal and Hydro Prime Movers", "Managerial Economics & Financial Analysis", "Thermal and Hydro Laboratory", "Electrical Circuits Laboratory", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "2-2", "Electrical Measurements", "Electrical Machines-II", "Switching Theory and Logic Design", "Control Systems", "Power Systems-I", "Management Science", "Electrical Machines -I Laboratory", "Electronic Devices & Circuits Laboratory", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "3-1", "Power Systems-II", "Renewable Energy Sources", "Signals and Systems", "Pulse & Digital Circuits", "Power Electronics", "", "Electrical Machines-II Laboratory", "Control Systems Laboratory", "Electrical Measurements Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "3-2", "Power Electronic Controllers & Drives", "Power System Analysis", "Micro Processors and Micro controllers", "Data Structures", "Elective : Unix and Shell Programming,OOPS Through JAVA,VLSI Design, Robotics,Neural Networks &Fuzzy Logic,Energy Audit and Conservation & Management", "", "Power Electronics Laboratory", "Microprocessors & Microcontrollers Laboratory", "Data Structures Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "4-1", "Utilization of Electrical Energy", "Linear IC Applications", "Power System Operation & Control", "Switchgear and Protection", "Elective 1 :  Electrical Machine Modeling and Analysis,Advanced Control Systems,Programmable Logic Controllers & Applications, Instrumentation", "Elective 2 : Optimization Techniques,Electric Power Quality, Special Electrical Machines", "Electrical Simulation Laboratory", "Power Systems & Simulation Laboratory", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["EEE", "4-2", "Digital Control Systems", "HVDC Transmission", "Electrical Distribution Systems", "Elective 3 :  High Voltage Engineering, Flexible Alternating Current Transmission Systems,Power System Reforms", "", "", "Seminar", "", ""]);



    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "1-1", "English - I", "Mathematics - I", "Engineering Chemistry", "Engineering Mechanics", "Computer Programming", "Environmental Studies", "Engineering /Applied Chemistry Laboratory", "English - Communication Skills Lab - I", "Computer Programming Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "1-2", "English – II", "Mathematics – II ", "Mathematics – III", "Engineering Physics", "Basic Electrical and Electronics Engineering", "Engineering Drawing", "English - Communication Skills Lab - II ", "Engineering /Applied Physics Lab", "Engg. Workshop & IT Workshop"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "2-1", "Metallurgy & Materials Science", "Mechanics of Solids", "Thermodynamics", "Managerial Economics & Financial Analysis", "Fluid Mechanics & Hydraulic Machines", "Computer Aided Engineering Drawing Practice", "Electrical & Electronics Engg. Lab", "Mechanics of Solids & Metallurgy Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "2-2", "Kinematics of Machinery", "Thermal Engineering -I", "Production Technology", "Design of Machine Members -I", "Machine Drawing", "Industrial Engineering and Management", "Fluid Mechanics & Hydraulic Machines Lab", "Production Technology Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "3-1", "Dynamics of Machinery", "Metal Cutting & Machine Tools", "Design of Machine Members–II", "Operations Research", "Thermal Engineering -II", "", "Theory of Machines Lab", "Machine Tools Lab", "Thermal Engineering Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "3-2", "Metrology", "Instrumentation & Control Systems", "Refrigeration & Air-conditioning", "Heat Transfer", "Elective : Entrepreneurship,Data Base Management System,Waste Water Management,Computer Graphics,Industrial Robotics,Green Engineering Systems", "", "Heat Transfer Lab", "Metrology & Instrumentation Lab", "Computational Fluid Dynamics Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "4-1", "Mechatronics", "CAD/CAM", "Finite Element Methods", "Power Plant Engineering", "Elective 1 : Computational Fluid Dynamics, Condition Monitoring,Additive Manufacturing", "Elective 2 : Advanced Materials ,Design for Manufacture, Gas Dynamics & Jet Propulsion", "CAD/CAM Lab", "Mechatronics Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ME", "4-2", "Production Planning and Control", "Unconventional Machining Processes", "Automobile Engineering", "Elective 3 : Thermal Equipment Design,Non Destructive Evaluation,. Quality and Reliability Engineering", "", "", "Seminar", "", ""]);









    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "1-1", "English - I", "Mathematics - I", "Mathematics – II", "Applied Physics", "Computer Programming", "Engineering Drawing", "English - Communication Skills Lab - 1 ", "Applied / Engineering Physics Lab ", "Engineering Workshop& IT Workshop"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "1-2", "English – II", "Mathematics -III ", "Applied Chemistry ", "Electrical and Mechanical Technology ", "Environmental Studies", "Data Structures", "Applied / Engineering Chemistry Laboratory", "English - Communication Skills Lab – 2", "Computer Programming Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "2-1", "Electronic Devices and Circuits", "Switching Theory and Logic Design", "Signals and Systems", "Network Analysis", "Random Variables and Stochastic Process ", "Managerial Economics & Financial Analysis ", "Electronic Devices and Circuits Lab ", "Networks & Electrical Technology Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "2-2", "Electronic Circuit Analysis", "Control Systems" , "Electromagnetic Waves and Transmission Lines", "Analog Communications", "Pulse and Digital Circuits", "Management Science", "Electronic Circuit Analysis Lab", "Analog Communications Lab", ""]);

    await db.rawInsert(
    "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "3-1", "Computer Architecture and Organization", "Linear I C Applications ", "Digital I C Applications", "Digital Communications", "Antenna and Wave Propagation ", "", "Pulse and Digital Circuits Lab ", "Linear I C Applications Lab", "Digital I C Applications Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "3-2", "Micro Processors & Micro Controllers", "Micro Wave Engineering", "VLSI Design", "Digital Signal Processing ", "Elective : OOPs through Java, Data Mining,Industrial Robotics,Power Electronics,Bio-Medical Engineering,Artificial Neural Networks", "", "Micro Processors & Micro Controllers Lab", "VLSI Lab ", "Digital Communications Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "4-1", "Radar Systems ", "Digital Image Processing  ", "Computer Networks", "Optical Communications ", "Elective 1 :  TV Engineering ,Electronic Switching Systems,System Design through Verilog", "Elective 2 : Embedded Systems , Analog IC Design ,Network Security & Cryptography", "Micro Wave Engineering & Optical Lab", "Digital Signal Processing Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["ECE", "4-2", "Cellular Mobile Communications", "Electronic Measurements and Instrumentation", "Satellite Communications", "Elective 3 : Wireless sensors & Networks ,Digital IC Design,Operating Systems", "", "", "Seminar", "", ""]);











    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "1-1", "English - I", "Mathematics - I", "Mathematics – II", "Applied Physics", "Computer Programming", "Engineering Drawing", "English - Communication Skills Lab - 1 ", "Applied / Engineering Physics Lab ", "Computer Programming Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "1-2", "English – II", "Mathematics -III ", "Applied Chemistry ", "Object Oriented Programming through C++", "Environmental Studies", "Engineering Mechanics ", "Applied / Engineering Chemistry Laboratory", "English - Communication Skills Lab – 2", "Object Oriented Programming Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "2-1", "Statistics with R Programming", "Mathematical Foundations of Computer Science", "Digital Logic Design", "Python Programming", "Data Structures through C++", "Computer Graphics", "Data Structures through C++Lab", "Python Programming Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "2-2", "Software Engineering", "Java Programming", "Advanced Data Structures", "Computer Organization", "Formal Languages and Automata Theory", "Principles of Programming Languages", "Advanced Data Structures Lab", "Java Programming Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "3-1", "Compiler Design", "Unix Programming", "Object Oriented Analysis and Design using UML", "Database Management Systems", "Operating Systems", "", "Unified Modeling Lab", "Operating System & Linux Programming Lab", "Database Management System Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "3-2", "Computer Networks", "Data Warehousing and Mining ", "Design and Analysis of Algorithms", "Software Testing Methodologies", "Elective : Artificial Intelligence,Internet of Things, Cyber Security,Digital Signal Processing,Embbeded Systems,Robotics", "", "Network Programming Lab", "Software Testing Lab ", "Data Warehousing and Mining Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "4-1", "Cryptography and Network Security", "Software Architecture & Design Patterns ", "Web Technologies", "Managerial Economics and Financial Analysis", "Elective 1 :  Big Data Analytics,Information Retrieval Systems,Mobile Computing", "Elective 2 :  Cloud Computing ,Software Project Management,  Scripting Languages", "Software Architecture& Design Patterns Lab ", "Web Technologies Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["CSE", "4-2", "Distributed Systems", "Management Science", "Machine Learning", "Elective 3 : Concurrent and Parallel Programming ,Artificial Neural Networks,Operations Research", "", "", "Seminar", "", ""]);








    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "1-1", "English - I", "Mathematics - I", "Mathematics – II", "Applied Physics", "Computer Programming", "Engineering Drawing", "English - Communication Skills Lab - 1 ", "Applied / Engineering Physics Lab ", "Computer Programming Laboratory"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "1-2", "English – II", "Mathematics -III ", "Applied Chemistry ", "Object Oriented Programming through C++", "Environmental Studies", "Engineering Mechanics ", "Applied / Engineering Chemistry Laboratory", "English - Communication Skills Lab – 2", "Object Oriented Programming Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "2-1", "Statistics with R Programming", "Mathematical Foundations of Computer Science", "Digital Logic Design", "Python Programming", "Data Structures through C++", "Software Engineering", "Data Structures through C++Lab", "Python Programming Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "2-2", "Computer Graphics", "Java Programming", "E-Commerce", "Computer Organization", "Object Oriented Analysis and Design using UML ", "Principles of Programming Languages", "Unified Modeling Languages Lab", "Java Programming Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "3-1", "Human Computer Interaction", "Unix and Shell Programming", "Advanced Java Programming", "Database Management Systems", "Operating Systems", "", "Advanced Java Programming Lab", "Unix and Operating Systems Lab", "Database Management System Lab"]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "3-2", "Computer Networks", "Data Mining", "Web Technologies", "Software Testing Methodologies", "Elective : Artificial Intelligence, Social Networks and Semantic Web,Digital Signal Processing,Embbeded Systems, Robotics ,Operations Research", "", "Web Technologies Lab", "Software Testing Lab ", "Data Mining Lab "]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "4-1", "Cryptography and Network Security", "Mobile Computing", "Data Ware Housing and Business Intelligence ", "Managerial Economics and Financial Analysis", "Elective 1 :  Big Data Analytics,Information Retrieval Systems, Internet of Things,Multimedia Programming", "Elective 2 :  Cloud Computing ,Software Project Management,Machine Learning,Decision Support System", "Mobile Computing Lab", "Cryptography and Network Security Lab", ""]);

    await db.rawInsert(
        "INSERT INTO Subjects ('branch', 'semester', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?,?)", ["IT", "4-2", "Distributed Systems", "Management Science", "Management Information System", "Elective 3 : Concurrent and Parallel Programming,Cyber Security,Artificial Neural Networks, Software Quality Assurance ", "", "", "Seminar", "", ""]);



  }

  // To get subjects that match the following query (branch and semester)
  Future<Subjects> getSubjects(String branch,String semester) async {
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM Subjects WHERE branch=? and semester=?', [branch,semester]) ;
    return res.isNotEmpty? Subjects.fromMap(res.first): Null;
  }


  //To get all rows from Subjects table
  Future<List<Subjects>> getAll() async{
    final db = await database;
    var res = await db.query("Subjects");
    List<Subjects> list = res.isNotEmpty?res.map((c) => Subjects.fromMap(c)).toList() : [];
    return list;
  }



  //To insert details(branch, category) into Details table
  insertDetails(String branch, String category) async{
    final db = await database;

    await db.rawInsert(
        "INSERT INTO Details ('branch', 'category') VALUES (?,?)", [branch,category]);

  }

  //To get all rows from Details table
  Future<List<Details>> getDetails() async{
    final db = await database;
    var res = await db.query("Details");
    List<Details> list = res.isNotEmpty?res.map((c) => Details.fromMap(c)).toList() : [];
    return list;
  }



  //To get all rows from Semester table
  Future<List<Semesters>> getSemesters() async{
    final db = await database;
    var res = await db.query("Semesters");
    List<Semesters> list = res.isNotEmpty?res.map((c) => Semesters.fromMap(c)).toList() : [];
    return list;
  }
  
  //To Insert semesters to the Semester table
  insertSemesters(String sem,String sgpa,String cgpa) async {
    final db = await database;

    await db.rawInsert(
        "INSERT INTO Semesters ('sem', 'sgpa', 'cgpa') VALUES (?,?,?)", [sem,sgpa,cgpa]);

  }

  //To update semesters table
  updateSemesters(Semesters semesters) async {
    final db = await database;
    var res = await db.update(
        "Semesters", semesters.toMap(), where: "sem = ?", whereArgs: [semesters.sem]
    );
    return res;
  }

  
  
  //To Insert grades to the Grades table
  insertGrades(String sem,String subject1,String subject2,String subject3,String subject4,String subject5,String subject6,String lab1,String lab2,String lab3) async {
    final db = await database;

    await db.rawInsert(
        "INSERT INTO Grades ('sem', 'subject1', 'subject2', 'subject3', 'subject4', 'subject5', 'subject6', 'lab1', 'lab2', 'lab3') VALUES (?,?,?,?,?,?,?,?,?,?)", [sem,subject1,subject2,subject3,subject4,subject5,subject6,lab1,lab2,lab3]);

  }

  //To get all rows from Grades table
  Future<List<Grades>> getGrades() async{
    final db = await database;
    var res = await db.query("Grades");
    List<Grades> list = res.isNotEmpty?res.map((c) => Grades.fromMap(c)).toList() : [];
    return list;
  }


  // To get subjects that match the following query (semester) from Grades table
  Future<Grades> getGradesOfSemester(String semester) async {
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM Grades WHERE sem=?', [semester]) ;
    return res.isNotEmpty? Grades.fromMap(res.first): Null;
  }

  //To update grades of certain semester
  updateGrades(Grades grades) async {
    final db = await database;
    var res = await db.update(
      "Grades", grades.toMap(), where: "sem = ?", whereArgs: [grades.sem]
    );
    return res;
  }

}

