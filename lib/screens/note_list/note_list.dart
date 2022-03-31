import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/model/model.dart';

import 'package:todoapp/screens/edit_and_view/edit_and_view_notes.dart';
import 'package:todoapp/screens/my_notes/my_notes.dart';
import 'package:todoapp/widgets/custom_appbar.dart';

class NoteList extends StatelessWidget {
  static const route = "/notelist";
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final NoteController notecontroller = Get.put(NoteController());

    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          child: CustomAppbar(text: 'Notes'),
          preferredSize: Size.fromHeight(kToolbarHeight)),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Get.toNamed(
              MyNote.route,
            )),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          child: Obx(
            () => notecontroller.notes.length == 0
                ? Center(
                    child: Lottie.asset('assets/lf30_editor_vsrnqp4c.json'),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount: notecontroller.notes.length,
                      itemBuilder: (context, index) => Dismissible(
                        background: Container(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.delete_forever,
                          ),
                          color: Colors.redAccent.withOpacity(0.2),
                        ),
                        key: Key('1'),
                        onDismissed: (direction) {
                          snackbarmethod(notecontroller, index);
                          notecontroller.remove(index);
                        },
                        child: GestureDetector(
                          onLongPress: () => Get.defaultDialog(
                              title: 'You want to delete ' +
                                  notecontroller.notes[index].title +
                                  '?',
                              onCancel: () => Get.back(),
                              middleText: "",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                notecontroller.remove(index);
                                Get.back();
                              }),
                          onTap: (() {
                            Get.toNamed(EditNotes.route, arguments: [
                              notecontroller.notes[index].title,
                              notecontroller.notes[index].description,
                              index
                            ]);
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                borderRadius: BorderRadius.circular(7)),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Text(
                                    notecontroller.notes[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    notecontroller.notes[index].description,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  SnackbarController snackbarmethod(NoteController notecontroller, int index) {
    return Get.snackbar('${notecontroller.notes[index].title} is deleted', '',
        duration: Duration(seconds: 2),
        mainButton: TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.yellow, fontSize: 25),
            ),
          ),
          onPressed: () {
            // notecontroller.add(NoteModel(
            //   title: notecontroller.notes[index].title,
            //   description:
            //       notecontroller.notes[index].description,
            // ));
          },
          child: Text(
            'Undo',
          ),
        ),
        snackPosition: SnackPosition.BOTTOM);
  }
}
