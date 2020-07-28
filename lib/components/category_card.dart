import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final String title;
  final int count;

  int _selected = 0;

  CategoryCard({ this.index, this.title, this.count });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 240,
      width: 175,
      decoration: BoxDecoration(
          color: _selected == index
              ? Color(0xFF417BFB)
              : Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            _selected == index ?
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 10
              ) :
            BoxShadow(color: Colors.transparent)
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: _selected == index ? Colors.white : Color(0xFFAFB4C6),
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: _selected == index ? Colors.white : Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}