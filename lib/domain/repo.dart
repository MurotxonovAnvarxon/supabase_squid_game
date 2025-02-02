import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_squid_game/data/employee_model.dart';
import 'package:supabase_squid_game/main.dart';

class EmployeeDataBase {
  final database = Supabase.instance.client.from("employee");

  //create employee
  Future createEmployee(EmployeeModel data) async {
    try {
      await database.insert(data.toMap());
    } catch (e) {
      rethrow;
    }
  }

  //getEmployees
  Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await supabase.from("employee").select('*');
      return response.map((v) => EmployeeModel.fromMap(v)).toList();
    } catch (e) {
      rethrow;
    }
  }

  //update employee
  Future<EmployeeModel?> updateEmployee(EmployeeModel data) async {
    try {
      final response = await supabase
          .from('employee')
          .update(data.toMap())
          .eq('id', data.id ?? -1)
          .select()
          .single();

      return EmployeeModel.fromMap(response);
    } catch (e) {
      rethrow;
    }
  }

  //delete employee
  Future deleteEmployee(int id) async {
    await database.delete().eq("id", id);
  }
}
