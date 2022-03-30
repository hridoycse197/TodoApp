import 'package:get/get.dart';
import 'package:todoapp/model/model.dart';

class NoteController extends GetxController {
  var notes = <NoteModel>[].obs;

  void add(NoteModel note) {
    notes.add(note);
  }
}
