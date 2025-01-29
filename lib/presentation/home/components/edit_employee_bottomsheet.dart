import 'package:flutter/material.dart';

class EditEmployeeBottomsheet extends StatefulWidget {
  const EditEmployeeBottomsheet({super.key, required this.name, required this.id});

  final String name;
  final int id;

  @override
  State<EditEmployeeBottomsheet> createState() => _EditEmployeeBottomsheetState();
}

class _EditEmployeeBottomsheetState extends State<EditEmployeeBottomsheet> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.name;
  }

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
                onTap: () {
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
