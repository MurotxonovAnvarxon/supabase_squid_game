part of 'home_bloc.dart';

class HomeState {
  final List<EmployeeModel>? data;

  HomeState({this.data});

  HomeState copyWith({
    final List<EmployeeModel>? data,
  }) =>
      HomeState(data: data ?? this.data);
}
