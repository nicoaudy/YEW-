import 'package:flutter/material.dart';

import 'package:quill_delta/quill_delta.dart';
import 'package:yew/components/header.dart';
import 'package:zefyr/zefyr.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  ZefyrController _controller;
  TextEditingController _titleInput = new TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("Quick start\n");
    return NotusDocument.fromDelta(delta);
  }

  handleSubmit() {
    print("hi im clicked");
    print(_controller.document);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
            Header(children: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(controller: _titleInput, decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title Goes Here...",
                    )),
                  ),
                  SizedBox(width: 10),
                  Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => {}
                        ),
                        IconButton(
                            icon: Icon(Icons.save),
                            onPressed: () => {}
                        ),
                      ],
                    ),
                ]
            ), padding: 0),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ZefyrScaffold(
                  child: ZefyrEditor(
                    padding: EdgeInsets.all(16),
                    controller: _controller,
                    focusNode: _focusNode,
                  ),
                )
              ),
          ],
        ),
    );
  }
}
