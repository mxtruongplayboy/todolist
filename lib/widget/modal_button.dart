import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModalButton extends StatelessWidget {
  ModalButton({
    Key? key,
    required this.addTask,
  }) : super(key: key);

  final Function addTask;
  TextEditingController controller = TextEditingController();
  void add(BuildContext context) {
    String name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Task',
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => add(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
