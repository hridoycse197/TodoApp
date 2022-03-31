import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';

class TextFormFieldWidget extends StatelessWidget {
  NoteController noteController = Get.put(NoteController());
  String hinttext;
  VoidCallback oneditingfunction;
  int maxlines;
  TextFormFieldWidget(
      {Key? key,
      required this.titleEditingController,
      required this.hinttext,
      required this.oneditingfunction,
      required this.maxlines})
      : super(key: key);

  final TextEditingController titleEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: oneditingfunction,
      textAlign: TextAlign.justify,
      controller: titleEditingController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          hintText: hinttext,
          labelStyle: TextStyle(fontSize: 20, color: Color(0xff000000)),
          border: InputBorder.none),
    );
  }
}
