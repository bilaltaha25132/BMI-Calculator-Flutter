import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.iconData, this.iconText);

  final IconData iconData;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          iconText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
