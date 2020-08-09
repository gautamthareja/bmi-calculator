import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCardDataTop extends StatelessWidget {
  final IconData iconData;
  final String label;

  const ReusableCardDataTop({@required this.iconData, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
