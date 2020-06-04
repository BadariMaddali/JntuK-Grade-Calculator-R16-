class SgpaCalculation {

  List<String> listOfGrades;
  int noOfSubjects,noOfLabs;
  String sgpa,percentage;
  SgpaCalculation(List<String> listOfGrades, int noOfSubjects, int noOfLabs){
    this.listOfGrades = listOfGrades;
    this.noOfSubjects = noOfSubjects;
    this.noOfLabs = noOfLabs;
  }

  int getPoint(String grade){
    switch(grade){
      case 'O' : return 10;
      case 'S' : return 9;
      case 'A' : return 8;
      case 'B' : return 7;
      case 'C' : return 6;
      case 'D' : return 5;
      case 'F' : return 0;
    }
    return 0;
  }
  String getSgpa(){
    int numerator=0;
    for(int i=0;i<noOfSubjects;i++){
      numerator += (getPoint(listOfGrades[i])*3);
    }
    for(int i=noOfSubjects; i<(noOfSubjects+noOfLabs);i++){
      numerator += (getPoint(listOfGrades[i])*2);
    }

    int denominator = (noOfSubjects*3)+(noOfLabs*2);

    if(noOfSubjects == 4 && noOfLabs==1){
      numerator += (getPoint(listOfGrades[5]) * 10);
      denominator += 10;
    }
    this.sgpa = double.parse((numerator/denominator).toStringAsFixed(2)).toString();
    return this.sgpa;
  }

  double getDSgpa(){
    return double.parse(this.sgpa);
  }
  String getPercentage(){
    double spga = double.parse(this.sgpa);
    this.percentage = double.parse(((double.parse(this.sgpa) - 0.75)*10).toStringAsFixed(2)).toString();
    return this.percentage;
  }

}