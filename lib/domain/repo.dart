import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_squid_game/data/employee_model.dart';

class EmployeeDataBase {
  final database = Supabase.instance.client.from("employee");

  //create employee
  Future createEmployee(EmployeeModel data) async {
    await database.insert(data.toMap());
  }

  //getEmployees
  final stream = Supabase.instance.client
      .from("employee")
      .stream(primaryKey: ["id"]).map((data) => data
          .map((employeeMap) => EmployeeModel.fromMap(employeeMap))
          .toList());

//update employee
// Future updateEmployee(EmployeeModel oldEmployee,String newName)async{
// await database.update({"employee":})
// }

  //delete employee
  Future deleteEmployee(EmployeeModel data) async {
    await database
        .delete()
        .eq("id", (data.id != null ? data.id : null) as Object);
  }
}
