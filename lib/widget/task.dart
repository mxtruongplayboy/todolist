import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class task extends StatelessWidget {
  task(
      {super.key,
      required this.item,
      required this.deleteTask,
      required this.index});

  var item;
  final Function deleteTask;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index % 2 == 0
            ? const Color(0xffDFDFDF)
            : Color.fromARGB(255, 121, 121, 121)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  color: Color(0xff4B4B4B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  deleteTask(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
