import 'package:flutter/foundation.dart';

import 'package:yew/models/note.model.dart';
import 'package:zefyr/zefyr.dart';

class NoteProvider with ChangeNotifier {
  final List<NoteModel> _notes = [];

  get total => _notes.length;

  get allNotes => _notes;

  void addNote(NoteModel payload) {
    _notes.add(payload);

    notifyListeners();
  }

  void update(String id, String title, NotusDocument content) {
    var current = _notes.firstWhere((element) => element.id == id);

    current.title = title;
    current.content = content;

    notifyListeners();
  }
}
