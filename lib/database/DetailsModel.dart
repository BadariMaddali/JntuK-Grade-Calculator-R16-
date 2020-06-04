import 'dart:convert';

class Details{
  String branch;
  String category;

  Details({
    this.branch,
    this.category,

  });

  factory Details.fromMap(Map<String, dynamic> json) => new Details(
    branch: json["branch"],
    category: json["category"],
  );

  Map<String,dynamic> toMap() => {
    "branch" : branch,
    "category" : category,
  };

}

Details detailsfromJson(String str){
  final jsonData = json.decode(str);
  return Details.fromMap(jsonData);
}

String detailstoJson(Details data){
  final dyn = data.toMap();
  return json.encode(dyn);
}
