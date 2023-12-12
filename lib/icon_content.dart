import 'package:flutter/material.dart';
import 'constants.dart';

class mars_venus_widget extends StatelessWidget {
  mars_venus_widget(this.userDefinedIcon, this.userDefinedText);

  final IconData userDefinedIcon;
  final String userDefinedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          userDefinedIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          userDefinedText,
          style: labelTextStyle,
        )
      ],
    );
  }
}
