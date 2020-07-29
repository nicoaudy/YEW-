import 'package:flutter/material.dart';

import 'package:yew/app.dart';
import 'package:provider/provider.dart';
import 'package:yew/providers/note.provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<NoteProvider>(create: (_) => NoteProvider()),
      ],
      child: App()
    )
  );
}

