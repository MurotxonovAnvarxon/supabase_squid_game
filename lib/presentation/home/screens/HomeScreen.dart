import 'package:flutter/material.dart';
import 'package:supabase_squid_game/application/home/home_bloc.dart';
import 'package:supabase_squid_game/data/employee_model.dart';
import 'package:supabase_squid_game/presentation/home/components/add_employee_bottomsheet.dart';
import 'package:supabase_squid_game/presentation/home/components/home_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetAllEmployeeEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red.shade900,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: const Color.fromRGBO(122, 9, 4, 1),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const AddEmployeeBottomsheet(),
                      );
                    }).then((v) {
                  if (v != null) {
                    String name = v;
                    bloc.add(CreateEmployeeEvent(
                        data: EmployeeModel( employeeName: name, )));
                  }
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                itemCount: state.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return HomeListItem(
                    name: state.data?[index].employeeName ?? "",
                    onDelete: () {},
                  );
                }),
          );
        },
      ),
    );
  }
}
