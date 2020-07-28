import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget children;
  final double padding;
  Header({ this.padding, this.children });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: children,
        ),
    );
  }
}
