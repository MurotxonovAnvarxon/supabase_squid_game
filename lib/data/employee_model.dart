class EmployeeModel {
  final int? id;
  final String employeeName;

  EmployeeModel(
      {
    this.id,
    required this.employeeName,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
    id:  map["id"] != null ? map["id"] as int : 0,
      employeeName:
          map["employee_name"] != null ? map["employee_name"] as String : "",
    );
  }

  @override
  String toString() {
    return 'EmployeeModel{id: $id,  employeeName: $employeeName}';
  }

  Map<String, dynamic> toMap() {
    return {
      "employee_name": employeeName,
    };
  }
}
