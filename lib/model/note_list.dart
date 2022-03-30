import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/screens/edit_notes.dart';
import 'package:todoapp/screens/my_notes.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteController notecontroller = Get.put(NoteController());
    var reversedata = notecontroller.notes.reversed.toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Get.to(
              MyNote(),
            )),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          child: Obx(
            () => notecontroller.notes.length == 0
                ? Center(
                    child: Image.asset('assets/bg.png'),
                  )
                : MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: notecontroller.notes.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (() {
                        Get.to(
                          EditNotes(
                            index: index,
                          ),
                        );
                      }),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height * .10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      reversedata[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 20),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: 'You want to delete ' +
                                              notecontroller
                                                  .notes[index].title +
                                              '?',
                                          onCancel: () => Get.back(),
                                          middleText: "",
                                          confirmTextColor: Colors.white,
                                          onConfirm: () {
                                            notecontroller.notes
                                                .removeAt(index);
                                            Get.back();
                                          });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              reversedata[index].description,
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
