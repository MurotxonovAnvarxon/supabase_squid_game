part of 'home_bloc.dart';

class HomeState {
  final List<EmployeeModel>? data;
  final Status? status;
  final String? errorMessage;

  HomeState({this.status, this.data, this.errorMessage});

  HomeState copyWith(
          {final List<EmployeeModel>? data,
          final Status? status,
          final String? errorMessage}) =>
      HomeState(
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        status: status ?? this.status,
      );
}
