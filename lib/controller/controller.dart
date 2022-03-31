import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/model/model.dart';

class NoteController extends GetxController {
  var notes = <NoteModel>[].obs;

  void add(NoteModel note) {
    notes.add(note);
  }

  void remove(int index) {
    notes.removeAt(index);
  }

  //storage
  @override
  void onInit() {
    super.onInit();
    List? storedNotes = GetStorage().read<List>('notes');
    if (storedNotes != null) {
      notes = storedNotes.map((e) => NoteModel.fromJson(e)).toList().obs;
    }
    ever(notes, (_) {
      GetStorage().write('notes', notes.toList());
    });
  }
}
