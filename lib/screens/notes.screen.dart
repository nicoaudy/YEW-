import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quill_delta/quill_delta.dart';
import 'package:uuid/uuid.dart';
import 'package:yew/components/header.dart';
import 'package:yew/models/note.model.dart';
import 'package:yew/providers/note.provider.dart';
import 'package:zefyr/zefyr.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  ZefyrController _editorInput;
  FocusNode _focusNode;
  TextEditingController _titleInput = new TextEditingController();

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _editorInput = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("Start writing\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    var noteStore = Provider.of<NoteProvider>(context);
    var uuid = Uuid();

    handleSubmit() {
      final payload = NoteModel(
        id: uuid,
        title:
            _titleInput.text == '' ? NoteModel.DEFAULT_TITLE : _titleInput.text,
        content: _editorInput.document,
      );

      noteStore.addNote(payload);

      Navigator.pop(context);
    }

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
