import 'package:flutter/material.dart';

class AddEmployeeBottomsheet extends StatefulWidget {
  const AddEmployeeBottomsheet({super.key});

  @override
  State<AddEmployeeBottomsheet> createState() => _AddEmployeeBottomsheetState();
}

class _AddEmployeeBottomsheetState extends State<AddEmployeeBottomsheet> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

                onTap: (){
                  Navigator.of(context).pop(controller.text.trim());
                },
                child: Container(
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: const Center(child: Text("Save")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
