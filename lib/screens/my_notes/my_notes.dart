import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/model.dart';
import 'package:todoapp/screens/my_notes/widgets/text_form_field_widget.dart';
import 'package:todoapp/widgets/custom_appbar.dart';

import 'widgets/floating_action_button_widget.dart';

class MyNote extends StatelessWidget {
  static const route = "/mynote";
  var getarguments = Get.arguments;
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController desEditingController = TextEditingController();
  final NoteController noteController = Get.find();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      floatingActionButton: FloatingActionButtonWidget(
          noteController: noteController,
          titleEditingController: titleEditingController,
          desEditingController: desEditingController),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            text: 'Write New Note',
          )),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .015),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                child: Column(
                  children: [
                    TextFormFieldWidget(
                        maxlines: 1,
                        titleEditingController: titleEditingController,
                        oneditingfunction: () {},
                        hinttext: 'Title.....'),
                    TextFormFieldWidget(
                        maxlines: 15,
                        titleEditingController: desEditingController,
                        oneditingfunction: () {
                          noteController.add(NoteModel(
                            title: titleEditingController.text,
                            description: desEditingController.text,
                          ));
                          Get.back();
                        },
                        hinttext: 'Start Typing.....')
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
