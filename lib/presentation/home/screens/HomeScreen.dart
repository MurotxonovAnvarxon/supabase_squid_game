import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supabase_squid_game/application/home/home_bloc.dart';
import 'package:supabase_squid_game/data/employee_model.dart';
import 'package:supabase_squid_game/presentation/home/components/add_employee_bottomsheet.dart';
import 'package:supabase_squid_game/presentation/home/components/edit_employee_bottomsheet.dart';
import 'package:supabase_squid_game/presentation/home/components/home_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_squid_game/utils/base.dart';
import 'package:supabase_squid_game/utils/enums.dart';

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
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Image.asset("assets/images/img.png"),
            ),
            backgroundColor: Colors.black,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: AppColors.primary,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddEmployeeBottomsheet(),
                      );
                    }).then((v) {
                  if (v != null) {
                    bloc.add(GetAllEmployeeEvent());
                  }
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: RefreshIndicator(
              onRefresh: ()async {
                bloc.add(GetAllEmployeeEvent());
              },
              child: Builder(builder: (context) {
                if (state.status == Status.success) {
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      itemCount: state.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return HomeListItem(
                          name: state.data?[index].employeeName ?? "",
                          onDelete: () async {
                            bloc.add(DeleteEmployeeEvent(
                                id: state.data?[index].id ?? -1));
                          },
                          onUpdate: () {
                            showModalBottomSheet(
                                backgroundColor: AppColors.primary,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: EditEmployeeBottomsheet(
                                      name: state.data?[index].employeeName ?? "",
                                      id: state.data?[index].id ?? -1,
                                    ),
                                  );
                                }).then((v) {
                              if (v != null) {
                                bloc.add(GetAllEmployeeEvent());
                              }
                            });
                          },
                        );
                      });
                }
                if (state.status == Status.loading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ));
                }
                if (state.status == Status.empty) {
                  return Center(
                    child: Text(
                      "Empty!",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                }
                if (state.status == Status.error) {
                  return const Center(
                    child: Text(
                      "Xatolik",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return const SizedBox();
              }),
            ),
          );
        },
      ),
    );
  }
}
