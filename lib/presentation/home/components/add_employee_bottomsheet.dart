import 'package:flutter/material.dart';
import 'package:supabase_squid_game/application/home/home_bloc.dart';
import 'package:supabase_squid_game/data/employee_model.dart';
import 'package:supabase_squid_game/utils/base.dart';
import 'package:supabase_squid_game/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeBottomsheet extends StatefulWidget {
  const AddEmployeeBottomsheet({
    super.key,
  });

  @override
  State<AddEmployeeBottomsheet> createState() => _AddEmployeeBottomsheetState();
}

class _AddEmployeeBottomsheetState extends State<AddEmployeeBottomsheet> {
  TextEditingController controller = TextEditingController();
  final bloc = HomeBloc();

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
          if (state.status == Status.success) {
            Navigator.of(context).pop(true);
          }
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      maxLines: 4,
                      minLines: 1,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter text!",
                        hintStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: controller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (controller.text.isNotEmpty) {
                          bloc.add(CreateEmployeeEvent(
                              data: EmployeeModel(
                            employeeName: controller.text.trim(),
                          )));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: state.status == Status.loading
                            ?  Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
