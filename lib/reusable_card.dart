import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color userDefinedColor;
  final Widget cardChild;

  ReusableCard(@required this.userDefinedColor, this.cardChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: userDefinedColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
