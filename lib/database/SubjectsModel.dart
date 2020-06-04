import 'dart:convert';

class Subjects{
  String branch;
  String semester;
  String subject1;
  String subject2;
  String subject3;
  String subject4;
  String subject5;
  String subject6;
  String lab1;
  String lab2;
  String lab3;

  Subjects({
    this.branch,
    this.semester,
    this.subject1,
    this.subject2,
    this.subject3,
    this.subject4,
    this.subject5,
    this.subject6,
    this.lab1,
    this.lab2,
    this.lab3,
  });

  factory Subjects.fromMap(Map<String, dynamic> json) => new Subjects(
    branch: json["branch"],
    semester: json["semester"],
    subject1: json["subject1"],
    subject2: json["subject2"],
    subject3: json["subject3"],
    subject4: json["subject4"],
    subject5: json["subject5"],
    subject6: json["subject6"],
    lab1: json["lab1"],
    lab2: json["lab2"],
    lab3: json["lab3"],
  );

  Map<String,dynamic> toMap() => {
    "branch" : branch,
    "semester" : semester,
    "subject1" : subject1,
    "subject2" : subject2,
    "subject3" : subject3,
    "subject4" : subject4,
    "subject5" : subject5,
    "subject6" : subject6,
    "lab1" : lab1,
    "lab2" : lab2,
    "lab3" : lab3,
  };



}

Subjects subjectsfromJson(String str){
  final jsonData = json.decode(str);
  return Subjects.fromMap(jsonData);
}

String subjectstoJson(Subjects data){
  final dyn = data.toMap();
  return json.encode(dyn);
}


