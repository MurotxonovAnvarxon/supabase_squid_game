part of 'home_bloc.dart';

class HomeEvent {}
class CreateEmployeeEvent extends HomeEvent {
  final EmployeeModel data;

  CreateEmployeeEvent({required this.data});
}

class DeleteEmployeeEvent extends HomeEvent{
  final int id;

  DeleteEmployeeEvent({required this.id});
}

class UpdateEmployeeEvent extends HomeEvent{

}

class GetAllEmployeeEvent extends HomeEvent{

}