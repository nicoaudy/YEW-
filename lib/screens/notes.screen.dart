import 'package:flutter/material.dart';

import 'package:quill_delta/quill_delta.dart';
import 'package:yew/components/header.dart';
import 'package:yew/models/note.model.dart';
import 'package:zefyr/zefyr.dart';

class NotesScreen extends StatefulWidget {
  final NoteModel _note;
  NotesScreen({Key key, note}) : _note = note;

  @override
  _NotesScreenState createState() => _NotesScreenState(note: _note);
}

class _NotesScreenState extends State<NotesScreen> {
  final NoteModel _note;
  _NotesScreenState({Key key, note}) : _note = note;

  ZefyrController _editorInput;
  TextEditingController _titleInput = new TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _editorInput = ZefyrController(document);
    _focusNode = FocusNode();

    _titleInput.text = _note.noteTitle;
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert(_note.noteContent);
    return NotusDocument.fromDelta(delta);
  }

  handleSubmit() {
    print("hi im clicked");
    print(_editorInput.document);
    print(_titleInput.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Header(
              children: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _titleInput,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title Goes Here...",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => {},
                      ),
                      IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () => handleSubmit(),
                      ),
                    ],
                  ),
                ],
              ),
              padding: 0,
            ),
          ),
          Expanded(
            child: ZefyrScaffold(
              child: ZefyrEditor(
                padding: EdgeInsets.all(16),
                controller: _editorInput,
                focusNode: _focusNode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
