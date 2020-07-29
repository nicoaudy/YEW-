import 'package:flutter/material.dart';
import 'package:yew/models/note.model.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  get total => _notes.length;

  get allNotes => _notes;

  void addNote(NoteModel payload) {
    _notes.add(payload);

    notifyListeners();
  }
}