class CgpaCalculation {

  List<double> listOfSgpas;
  List<int> listOfGrades = [24,24,22,22,21,21,22,24];
  int index;
  String cgpa,percentage;
  CgpaCalculation(List<double> listOfsgpas, int index){
    this.listOfSgpas = listOfsgpas;
    this.index = index;
  }

  String getCgpa(){
    double numerator=0.0;
    double denominator=0.0;
    for(int i=0;i<=index;i++){
      numerator += (listOfSgpas[i]*listOfGrades[i]);
      denominator += listOfGrades[i];
    }
    this.cgpa = double.parse((numerator/denominator).toStringAsFixed(2)).toString();
    return this.cgpa;
  }
  String getPercentage(){
    this.percentage = double.parse(((double.parse(this.cgpa) - 0.75)*10).toStringAsFixed(2)).toString();
    return this.percentage;
  }

}