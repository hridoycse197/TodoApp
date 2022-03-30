import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/model.dart';

class EditNotes extends StatelessWidget {
  int index;
  EditNotes({required this.index});
  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController desEditingController = TextEditingController();
    final NoteController noteController = Get.find();

    var noteupdate = noteController.notes[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(' Create a New Note'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .015),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Card(
              borderOnForeground: true,
              elevation: 4,
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.justify,
                    controller: titleEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: ' Write Title',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Color(0xff000000)),
                        border: InputBorder.none),
                  ),
                  Divider(
                    height: 5,
                    thickness: 1,
                  ),
                  TextFormField(
                    textAlign: TextAlign.justify,
                    controller: desEditingController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: ' Write Description',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Color(0xff000000)),
                        border: InputBorder.none),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xfffc0515))),
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                noteController.notes.removeAt(index);
                noteController.add(
                  NoteModel(
                      title: titleEditingController.text,
                      description: desEditingController.text),
                );
                // } else {
                //   var updatenote = noteController.notes[index];
                //   updatenote.title = textEditingController.text;
                //   noteController.notes[index] = updatenote;
                // }
              },
              child: Text('Update'),
            ),
          ],
        ),
      )),
    );
  }
}
