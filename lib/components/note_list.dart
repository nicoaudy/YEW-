import 'package:flutter/material.dart';

import 'package:yew/components/note_card.dart';
import 'package:yew/providers/note.provider.dart';

class NoteList extends StatelessWidget {
  var notes = NoteProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: notes.total,
        itemBuilder: (context, index) {
          var note = notes.allNotes[index];
          return NoteCard(
            title: note.title,
            content: note.content,
            date: "20-08-2020",
          );
        },
      ),
    );
  }
}
