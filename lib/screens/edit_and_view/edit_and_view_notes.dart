import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/model.dart';
import 'package:todoapp/screens/edit_and_view/widgets/floating_action_button_widget.dart';
import 'package:todoapp/screens/edit_and_view/widgets/text_form_field_widget.dart';
import 'package:todoapp/widgets/custom_appbar.dart';

class EditNotes extends StatelessWidget {
  static const route = "/editnotes";
  var getarguments = Get.arguments;
  final NoteController noteController = Get.find();
  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController =
        TextEditingController(text: getarguments[0]);
    TextEditingController desEditingController =
        TextEditingController(text: getarguments[1]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(text: 'Update Note')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .015),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              children: [
                SizedBox(
                  height: height * .03,
                ),
                Column(
                  children: [
                    TextFormFieldWidget(
                      titleEditingController: titleEditingController,
                      oneditingfunction: () {
                        var edited_data = noteController.notes[getarguments[2]];

                        edited_data.title = titleEditingController.text;
                        edited_data.description = desEditingController.text;
                        noteController.notes[getarguments[2]] = edited_data;

                        Get.back();
                      },
                    ),
                    TextFormFieldWidget(
                      titleEditingController: desEditingController,
                      oneditingfunction: () {
                        var edited_data = noteController.notes[getarguments[2]];

                        edited_data.title = titleEditingController.text;
                        edited_data.description = desEditingController.text;
                        noteController.notes[getarguments[2]] = edited_data;

                        Get.back();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(onpressedfunction: (() {
        var edited_data = noteController.notes[getarguments[2]];

        edited_data.title = titleEditingController.text;
        edited_data.description = desEditingController.text;
        noteController.notes[getarguments[2]] = edited_data;

        Get.back();
      })),
    );
  }
}
