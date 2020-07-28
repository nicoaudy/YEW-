import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yew/components/category_card.dart';
import 'package:yew/components/note_card.dart';
import 'package:yew/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, int> categories = {
    'Notes': 112,
    'Reminder': 3,
    'Expenses': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(Utils.greetings(), style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                )),
                Row(
                  children: <Widget>[
                    Icon(Icons.more_vert),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length + 1,
              itemBuilder: (context, index) {
                if(index == 0) {
                  return SizedBox(width: 20);
                }

                return CategoryCard(
                    index: index - 1,
                    title: categories.keys.toList()[index - 1],
                    count: categories.values.toList()[index - 1]
                );
              },
            ),
          ),

          NoteCard(title: "Walk with dog", content: "Walk on the streeet with my favorite dog", date: "20-08-2020"),
          NoteCard(title: "Walk with dog", content: "Walk on the streeet with my favorite dog", date: "20-08-2020"),
        ],
     ),
    );
  }
}