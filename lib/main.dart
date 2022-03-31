import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/controller/controller.dart';
import 'package:todoapp/screens/note_list/note_list.dart';

import 'package:todoapp/screens/edit_and_view/edit_and_view_notes.dart';
import 'package:todoapp/screens/my_notes/my_notes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: NoteList.route,
          page: () => NoteList(),
        ),
        GetPage(
          name: MyNote.route,
          page: () => MyNote(),
        ),
        GetPage(
          name: EditNotes.route,
          page: () => EditNotes(),
        ),
      ],
      home: NoteList(),
    );
  }
}
