import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yew/screens/home.screen.dart';
import 'package:yew/providers/note.provider.dart';
import 'package:yew/screens/notes.screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>.value(value: NoteProvider()),
      ],
      child: MaterialApp(
        title: "YEW!",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
          '/notes': (context) => NotesScreen(),
        },
      ),
    );
  }
}
