class EmployeeModel {
  final int? id;
  final String employeeName;

  EmployeeModel(this.id,{  required this.employeeName});

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
       map["id"] as int,
      employeeName: map["employee_name"] as String,
    );
  }


  Map<String,dynamic> toMap(){
    return {
      "employee_name":employeeName,
      "id":id
    };
  }
}
