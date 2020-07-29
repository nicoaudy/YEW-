import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yew/components/note_card.dart';
import 'package:yew/providers/note.provider.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteProvider>(context);

    if (notes.allNotes.length == 0) {
      return Container(
        child: Center(
          child: Image(
            image: AssetImage('assets/images/empty.png'),
          ),
        ),
      );
    }

    return Container(
      child: ListView.builder(
        itemCount: notes.total,
        itemBuilder: (context, index) {
          var note = notes.allNotes[index];
          if (notes.allNotes.length == 0) {
            return Center(
              child: Text("There's no notes found"),
            );
          }

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
