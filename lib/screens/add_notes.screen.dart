import 'package:flutter/material.dart';

class AddNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
