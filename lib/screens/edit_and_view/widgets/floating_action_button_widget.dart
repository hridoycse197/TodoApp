import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/model.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  VoidCallback onpressedfunction;
  FloatingActionButtonWidget({Key? key, required this.onpressedfunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.check), onPressed: onpressedfunction);
  }
}
