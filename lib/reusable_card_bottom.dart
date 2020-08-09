import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ReusableCardDataBottom extends StatelessWidget {
  final String textData;
  final int intData;
  final Function onPressedDecrease;
  final Function onPressedIncrease;

  ReusableCardDataBottom({
    @required this.textData,
    @required this.intData,
    this.onPressedDecrease,
    this.onPressedIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          textData,
          style: kLabelTextStyle,
        ),
        Text(
          '$intData',
          style: kMajorTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: onPressedDecrease,
              child: Icon(
                Icons.remove_circle,
                color: Color(0xFF0277BD),
                size: 50,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: onPressedIncrease,
              child: Icon(
                Icons.add_circle,
                color: Color(0xFF0277BD),
                size: 50,
              ),
            ),
          ],
        )
      ],
    );
  }
}
