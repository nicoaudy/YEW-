import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yew/components/category_card.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://avatars1.githubusercontent.com/u/9676457?s=400&u=7cfbb324004d5d8b8426c304a939b2ea90ee2305&v=4')
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                SizedBox(width: 20),
                Text("Nico Audy", style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ))
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


          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Walk with dog',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '20-08-2020',
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  'Walk on the street with my favorite dog.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '20-08-2020',
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF417BFB),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
     ),
    );
  }
}