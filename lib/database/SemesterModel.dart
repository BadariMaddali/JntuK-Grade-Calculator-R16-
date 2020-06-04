import 'dart:convert';

class Semesters{
  String sem;
  String sgpa;
  String cgpa;

  Semesters({
    this.sem,
    this.sgpa,
    this.cgpa,

  });

  factory Semesters.fromMap(Map<String, dynamic> json) => new Semesters(
    sem: json["sem"],
    sgpa: json["sgpa"],
    cgpa: json["cgpa"],
  );

  Map<String,dynamic> toMap() => {
    "sem" : sem,
    "sgpa" : sgpa,
    "cgpa" : cgpa,
  };

}

Semesters semestersfromJson(String str){
  final jsonData = json.decode(str);
  return Semesters.fromMap(jsonData);
}

String semesterstoJson(Semesters data){
  final dyn = data.toMap();
  return json.encode(dyn);
}
