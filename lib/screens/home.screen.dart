import 'package:flutter/material.dart';

import 'package:yew/utils/utils.dart';
import 'package:yew/components/header.dart';
import 'package:yew/components/note_list.dart';
import 'package:yew/components/category_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, int> categories = {
    'Notes': 112,
    'Reminder': 3,
    'Expenses': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(
              children: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    Utils.greetings(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => Navigator.pushNamed(context, '/notes'),
                  )
                ],
              ),
              padding: 30,
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox(width: 20);
                  }

                  return CategoryCard(
                    index: index - 1,
                    title: categories.keys.toList()[index - 1],
                    count: categories.values.toList()[index - 1],
                  );
                },
              ),
            ),
            Expanded(child: NoteList())
          ],
        ),
      ),
    );
  }
}
