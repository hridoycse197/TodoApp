import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/model.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
    required this.noteController,
    required this.titleEditingController,
    required this.desEditingController,
  }) : super(key: key);

  final NoteController noteController;
  final TextEditingController titleEditingController;
  final TextEditingController desEditingController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Get.back();
          noteController.add(NoteModel(
              title: titleEditingController.text,
              description: desEditingController.text));
        });
  }
}
