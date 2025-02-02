import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_squid_game/data/employee_model.dart';
import 'package:supabase_squid_game/domain/repo.dart';
import 'package:supabase_squid_game/utils/enums.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    final repo = EmployeeDataBase();

    on<CreateEmployeeEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        final data = await repo.createEmployee(event.data);
        emit(state.copyWith(status: Status.success));
      } catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<GetAllEmployeeEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        var data = await repo.getEmployees();

        if (data.isEmpty) {
          emit(state.copyWith(status: Status.empty));
        } else {
          emit(state.copyWith(data: data, status: Status.success));
        }
      } catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
    on<DeleteEmployeeEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        await repo.deleteEmployee(event.id);
        emit(state.copyWith(status: Status.loading));
        add(GetAllEmployeeEvent());
      } catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });

    on<UpdateEmployeeEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        repo.updateEmployee(event.data);

        emit(state.copyWith(status: Status.success));

        add(GetAllEmployeeEvent());
      } catch (e) {
        emit(state.copyWith(status: Status.error, errorMessage: e.toString()));
      }
    });
  }
}
