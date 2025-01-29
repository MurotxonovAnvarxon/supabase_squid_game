import 'package:bloc/bloc.dart';
import 'package:supabase_squid_game/data/employee_model.dart';
import 'package:supabase_squid_game/domain/repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    final repo = EmployeeDataBase();
    on<CreateEmployeeEvent>((event, emit) async {
      try {


        final data=await repo.createEmployee(event.data);

      } catch (e) {
        print("#####################");
        print("${e.toString()}");
        print("#####################");
        // emit(state.copyWith());
      }
    });
  }
}
